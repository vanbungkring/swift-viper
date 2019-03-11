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

class ViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {
   
    let arrayOfContact = NSMutableArray();
    let store = CNContactStore()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.fetchContact()
        
    }
    @IBAction func contactAddButtonDidtapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add New Contact", message: "", preferredStyle: UIAlertController.Style.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.keyboardType = .numberPad
            textField.placeholder = "Enter PhoneNumber"
        }
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { alert -> Void in
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            let newContact = CNMutableContact()
            newContact.givenName = firstTextField.text ?? "";
            newContact.phoneNumbers = [CNLabeledValue(
                label:CNLabelPhoneNumberiPhone,
                value:CNPhoneNumber(stringValue:secondTextField.text!))]
            do {
                /// adding behavior to execute the add new contact
                let saveRequest = CNSaveRequest()
                saveRequest.add(newContact, toContainerWithIdentifier: nil)
                try! self.store.execute(saveRequest);
                self.fetchContact();
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: {
            (action : UIAlertAction!) -> Void in })
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    
    private func fetchContact(){
        ///remove all data cache everytime fetch the table
        self.arrayOfContact.removeAllObjects();
        print("attempting request contact access");
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                self.showAlert(title: "Error", msg: err.localizedDescription)
                return
            }
            if granted {
                print("Access Granted");
                let keys = [CNContactGivenNameKey,CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    try! self.store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                        self.arrayOfContact.add(contact);
                    })
                    self.tableView.reloadData();
                }
            } else {
                print ("Denied Permission");
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfContact.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell
        //casting the array of object into contact  object
        var contactObject = CNContact();
        contactObject = self.arrayOfContact[indexPath.row] as! CNContact;
        
        cell.textLabel?.text = contactObject.givenName;
        
        cell.detailTextLabel?.text = contactObject.phoneNumbers.first?.value.stringValue ?? "";
        
        return cell
    }
    
   
}

