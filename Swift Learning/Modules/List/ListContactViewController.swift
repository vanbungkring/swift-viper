//
//  ListContactViewController.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import UIKit
import Contacts


class ListContactViewController: BaseViewController {
    
    let store = CNContactStore()
    var contactArray = Array<Any>()
    private let presenter : ListContactPresenter
    @IBOutlet private var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Test Contact VIPER";
        ///register tableviewell Here, bit weird compare to old code
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewContact))
       requestContactPermission();
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        requestContactPermission();
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    @objc func addNewContact() {
        presenter.addContact();
    }
    
    init(presenter: ListContactPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    ///still use init with coder?
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func requestContactPermission(){

        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                self.showAlert(title: "Error", msg: err.localizedDescription)
            }
            if granted {
                self.loadContact()
            } else {
                self.showAlert(title: "Error", msg: "You need to allow apps to access Contact Book");
            }
        }
    }
    private func loadContact() {
        self.contactArray = self.presenter.getAllContact(contact: self.store)
        table.reloadData()
    }
}
extension ListContactViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contactArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        var contactObject = CNContact();
        contactObject = self.contactArray[indexPath.row] as! CNContact;
        cell.textLabel?.text = contactObject.givenName;
        cell.detailTextLabel?.text = contactObject.phoneNumbers.first?.value.stringValue ?? "";
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // presenter.selectContactHandler(index: indexPath.row)
    }
}
