//
//  AddNewContactGateway.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit
class AddNewContactConstructor {
    func compose() -> UIViewController {
        let navigator = AddNewContactNavigator()
        let interactor = AddNewContactInteractor()
        let presenter = AddNewContactPresenter(interactor: interactor, navigator: navigator)
        let view = AddNewContactViewController(presenter: presenter)
        presenter.view = view;
        return view;

    }

}
