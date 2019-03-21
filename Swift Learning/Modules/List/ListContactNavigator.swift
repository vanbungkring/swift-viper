//
//  ListContactRouter.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit
class ListContactNavigator {
    
    func addNewContact(view:ListContactViewController?) {
        let add = AddNewContactConstructor().compose()
        view?.navigationController?.pushViewController(add, animated: true)
    }
}
