//
//  AddNewContactPresenter.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation

class AddNewContactPresenter {
    weak var view: AddNewContactViewController?
    private let interactor :AddNewContactInteractor
    private let navigator :AddNewContactNavigator
    
    init(interactor:AddNewContactInteractor,navigator:AddNewContactNavigator) {
        self.interactor = interactor
        self.navigator = navigator
    }
    func save(name:String,phone:String) {
        interactor.saveContact(name: name, phone: phone);
        navigator.gobackToRoot(view: view);
    }
    func goback(){
        navigator.gobackToRoot(view: view)
    }
    
}
