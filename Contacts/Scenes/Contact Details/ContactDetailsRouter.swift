//
//  ContactDetailsRouter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ContactDetailsRouter {

    private weak var viewController: UIViewController?

    private init () {}

    private init(with viewController: UIViewController) {
        self.viewController = viewController
    }
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = ContactDetailsViewController(nibName: nil, bundle: nil)
        let interactor = ContactDetailsInteractor()
        let router = ContactDetailsRouter(with: view)
        let presenter = ContactDetailsPresenter(interface: view, interactor: interactor, router: router)

        view.setPresenter (presenter: presenter)
        interactor.setPresenter (presenter: presenter)

        return view
    }
}

extension ContactDetailsRouter: ContactDetailsWireframeProtocol {
    func getToEditScreen(contactToEdit: ContactViewModel) {
        viewController?.navigationController?.pushViewController(Container.getEditContactScreen(contactToEdit: contactToEdit), animated: true)
    }
    

}
