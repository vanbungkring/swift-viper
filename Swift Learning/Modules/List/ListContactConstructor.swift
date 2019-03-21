//
//  ListContactGateway.swift
//  Swift Learning
//
//  Created by Arie.Prasetiyo on 21/03/19.
//  Copyright © 2019 netra. All rights reserved.
//

import Foundation
import UIKit
class ListContactConstructor {
    func compose() -> UIViewController {
        let navigator = ListContactNavigator()
        let interactor = ListContactInteractor()
        let presenter = ListContactPresenter(interactor: interactor, navigator: navigator)
        let vc = ListContactViewController(presenter: presenter)
        presenter.view = vc;
        return UINavigationController(rootViewController: vc)
    }
}
