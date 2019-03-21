//
//  AddNewContatNavigator.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation

class AddNewContactNavigator {
    func gobackToRoot(view:AddNewContactViewController?) {
        view?.navigationController?.popToRootViewController(animated: true)
    }
}
