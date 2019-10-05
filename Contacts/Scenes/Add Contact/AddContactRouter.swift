//
//  AddContactRouter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class AddContactRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = AddContactViewController(nibName: nil, bundle: nil)
        let interactor = AddContactInteractor()
        let router = AddContactRouter(with: view)
        let presenter = AddContactPresenter(interface: view, interactor: interactor, router: router)

        view.setPresenter (presenter: presenter)
        interactor.setPresenter (presenter: presenter)

        return view
    }
}

extension AddContactRouter: AddContactWireframeProtocol {
    func NavigateToHome() {
        let home =  Container.embedVCInNavController(Container.getHomeScreen())
        Container.setRootViewController(home)
    }
    

}
