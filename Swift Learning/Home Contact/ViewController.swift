//
//  ViewController.swift
//  Swift Learning
//
//  Created by Vanbungkring on 3/11/19.
//  Copyright © 2019 netra. All rights reserved.
//

import UIKit
import AddressBook
import Contacts

class ViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate,CustomAlertDelegate {
    
    var arrayOfContact = NSMutableArray();
    let store = CNContactStore()
    let contactInteractor = ContactInteractor()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchContact()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    @IBAction func contactAddButtonDidtapped(_ sender: Any) {
        
        let alertController =  CustomAlert.showAlert(title: "Add New contact?", messages: "Are you sure?",delegates: self)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func saveButtonDiDtapped(contact: NSDictionary) {
        let newContact = CNMutableContact()
        newContact.givenName = contact["NAME"] as! String;
        newContact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:contact["PHONE"]as! String))]
        do {
            /// adding behavior to execute the add new contact
            let saveRequest = CNSaveRequest()
            saveRequest.add(newContact, toContainerWithIdentifier: nil)
            try! self.store.execute(saveRequest);
            self.fetchContact();
        }
    }
    private func fetchContact(){
        ///remove all data cache everytime fetch the table
        self.arrayOfContact.removeAllObjects();
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                self.showAlert(title: "Error", msg: err.localizedDescription)
                return
            }
            if granted {
                do {
                    let contactAray = self.contactInteractor.loadContact(contact: self.store)
                    self.arrayOfContact = contactAray as! NSMutableArray;
                    self.tableView.reloadData();
                }
            } else {
                self.showAlert(title: "Error", msg:"Denied Permission")
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfContact.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        var contactObject = CNContact();
        contactObject = self.arrayOfContact[indexPath.row] as! CNContact;
        cell.textLabel?.text = contactObject.givenName;
        cell.detailTextLabel?.text = contactObject.phoneNumbers.first?.value.stringValue ?? "";
        return cell
    }
    
    
}

