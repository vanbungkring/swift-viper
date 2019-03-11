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

class ViewController: BaseViewController {
    let store = CNContactStore()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchContact()
       
    }
    private func fetchContact(){
        print("attempting request contact access");
        let store = CNContactStore();
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
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                        print(contact.givenName);
                        print(contact.phoneNumbers.first?.value.stringValue ?? "")
                    })
                } catch let _ {
                    print("Failed to enumerate Contact");
                }
            } else {
                print ("Denied Permission");
            }
        }
    }
    
    @IBAction func contactAddButtonDidtapped(_ sender: Any) {
          showAlert(title: "Arie", msg: "Test")
    }
    
}

