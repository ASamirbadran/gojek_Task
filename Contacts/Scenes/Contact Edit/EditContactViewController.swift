//
//  EditContactViewController.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class EditContactViewController: BaseViewController {

    // MARK: - Public Variables
    private var presenter: EditContactPresenterProtocol?

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    // MARK: - Custom Setter
    public func setPresenter (presenter: EditContactPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - View controller lifecycle methods
extension EditContactViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
    }
}

// MARK: - IBActions
extension EditContactViewController {

}

// MARK: - Selectors
extension EditContactViewController {

}

// MARK: - Private
extension EditContactViewController {

}

// MARK: - Protocal
extension EditContactViewController: EditContactViewProtocol {

}
