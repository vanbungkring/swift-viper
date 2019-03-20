//
//  Alert.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 20/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit

class CustomAlert {
    static func showAlert(title:String,messages:String) -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: messages,
                                                preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.keyboardType = .numberPad
            textField.placeholder = "Enter PhoneNumber"
        }
        alertController.addAction(cancelAction(alertController: alertController))
         alertController.addAction(saveAction(alertController: alertController))
        return alertController;
    }
    
    private static func saveAction(alertController:UIAlertController) -> UIAlertAction {
        let cancelAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { (action : UIAlertAction!) -> Void in });
        return cancelAction;
    }
    private static func cancelAction(alertController:UIAlertController) -> UIAlertAction {
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { (action : UIAlertAction!) -> Void in });
        return cancelAction;
    }
    
    
}
