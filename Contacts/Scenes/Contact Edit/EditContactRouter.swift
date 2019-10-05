//
//  EditContactRouter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class EditContactRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = EditContactViewController(nibName: nil, bundle: nil)
        let interactor = EditContactInteractor()
        let router = EditContactRouter(with: view)
        let presenter = EditContactPresenter(interface: view, interactor: interactor, router: router)

        view.setPresenter (presenter: presenter)
        interactor.setPresenter (presenter: presenter)

        return view
    }
}

extension EditContactRouter: EditContactWireframeProtocol {

}
