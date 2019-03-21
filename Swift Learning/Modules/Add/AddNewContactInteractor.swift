//
//  AddNewContactInteractor.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import Contacts
class AddNewContactInteractor {
   
    func saveContact(name:String,phone:String) {
        let store = CNContactStore()
        let newContact = CNMutableContact()
        newContact.givenName = name;
        newContact.phoneNumbers = [CNLabeledValue(
            label:CNLabelPhoneNumberiPhone,
            value:CNPhoneNumber(stringValue:phone))]
        do {
            /// adding behavior to execute the add new contact
            let saveRequest = CNSaveRequest()
            saveRequest.add(newContact, toContainerWithIdentifier: nil)
            try! store.execute(saveRequest);
        }
        
    }
}
