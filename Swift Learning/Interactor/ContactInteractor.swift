//
//  ContactInteractor.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 20/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit
import Contacts

class ContactInteractor{
    func loadContact(contact:CNContactStore)->NSArray{
        let arrayOfObject = NSMutableArray();
        let keys = [CNContactGivenNameKey,CNContactPhoneNumbersKey]
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        do {
            try! contact.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                arrayOfObject.add(contact);
            })
            return arrayOfObject;
        }
    }
}
