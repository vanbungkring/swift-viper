//
//  ListContactInteractor.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import  Contacts
class ListContactInteractor {
    func saveStateContactPermission(isAllowed:Bool){
        UserDefaults.standard.set(true, forKey: "IS_ALLOWED_TO_ACCESS_CONTACT")
    }
    func getStateContactPermission() -> Bool {
        return UserDefaults.standard.bool(forKey: "IS_ALLOWED_TO_ACCESS_CONTACT")
    }
    func getContact(contact:CNContactStore)-> Array<Any> {
        let arrayOfObject = NSMutableArray();
        let keys = [CNContactGivenNameKey,CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try! contact.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                arrayOfObject.add(contact);
            })
            return arrayOfObject as! Array<Any>;
        }
    }
}
