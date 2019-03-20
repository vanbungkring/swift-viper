//
//  Alert.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 20/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit

protocol CustomAlertDelegate {
    func saveButtonDiDtapped(contact:NSDictionary)
}

class CustomAlert {
    static func showAlert(title:String,messages:String,delegates:CustomAlertDelegate) -> UIAlertController {
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
        alertController.addAction(saveAction(alertController: alertController, delegate: delegates))
        return alertController;
    }
    
    private static func saveAction(alertController:UIAlertController,delegate:CustomAlertDelegate) -> UIAlertAction {
        let saveAction = UIAlertAction(title: "Save", style: UIAlertAction.Style.default, handler: { (action : UIAlertAction!) -> Void in
            let nameText = alertController.textFields![0] as UITextField
            let phoneNumberText = alertController.textFields![1] as UITextField
            let dictionary:NSDictionary = [
                "NAME" : nameText.text ?? "",
                "PHONE" :  phoneNumberText.text ?? ""
            ]
            delegate.saveButtonDiDtapped(contact: dictionary)
        });
        
        return saveAction;
    }
    private static func cancelAction(alertController:UIAlertController) -> UIAlertAction {
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { (action : UIAlertAction!) -> Void in });
        return cancelAction;
    }
    
    
}
