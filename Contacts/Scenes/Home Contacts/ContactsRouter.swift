//
//  ContactsRouter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ContactsRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ContactsViewController(nibName: nil, bundle: nil)
        let interactor = ContactsInteractor()
        let router = ContactsRouter(with: view)
        let presenter = ContactsPresenter(interface: view, interactor: interactor, router: router)

        view.setPresenter (presenter: presenter)
        interactor.setPresenter (presenter: presenter)

        return view
    }
}

extension ContactsRouter: ContactsWireframeProtocol {
    func openContactDetailsScreen(contactUrl: String) {
        let detailsScreen = Container.getContactDetailsScreen(contactUrl: contactUrl)

        viewController?.navigationController?.pushViewController(detailsScreen, animated: true)
    }
}
