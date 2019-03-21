//
//  AddNewContactViewController.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import UIKit

class AddNewContactViewController: UIViewController {
   private let presenter : AddNewContactPresenter
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add New Contact"
        // Do any additional setup after loading the view.
    }
    init(presenter: AddNewContactPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    ///still use init with coder?
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }

    @IBAction func addNewContactDidTapped(_ sender: Any) {
        let name = nameTextField.text
        let phone = phoneNumberTextField.text
        if (name?.isEmpty)! || (phone?.isEmpty)!{
            self.showAlert(title: "Error", msg: "Phone Number or Name Cannot be empty")
            return
        }
        //passing it to presenter, let him handle the rest
        presenter.save(name: name!, phone: phone!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
