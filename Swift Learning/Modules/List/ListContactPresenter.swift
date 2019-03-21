//
//  ListContactPresenter.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import  Contacts
class ListContactPresenter {
    /// this class is like MVVM as View models, control all interaction between model,view, router and controller
    var view : ListContactViewController?
    private let navigator : ListContactNavigator
    private let interactor : ListContactInteractor
   
    init(interactor:ListContactInteractor, navigator:ListContactNavigator) {
        self.navigator = navigator
        self.interactor = interactor
    }
    func saveContactPermissionState(isAllow:Bool) {
        interactor.saveStateContactPermission(isAllowed: isAllow)
    }
    func getStatusContact() -> Bool {
        return interactor.getStateContactPermission()
    }
    func getAllContact(contact:CNContactStore) -> Array<Any> {
       return interactor.getContact(contact:contact)
    }
    func addContact(){
        navigator.addNewContact(view:view)
    }
}
