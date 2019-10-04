//
//  ContactsViewController.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ContactsViewController: BaseViewController {

    // MARK: - Public Variables
    internal var presenter: ContactsPresenterProtocol?

    // MARK: - Private Variables

    // MARK: - Computed Variables

    // MARK: - IBOutlets

    @IBOutlet weak private var contactsTableView: UITableView!
    // MARK: - Custom Setter
    public func setPresenter (presenter: ContactsPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - View controller lifecycle methods
extension ContactsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
        //getting contactList
        presenter?.getContacts()
        setupNavigationBar(title: "Contacts")
    }
}

// MARK: - IBActions
extension ContactsViewController {

}

// MARK: - Selectors
extension ContactsViewController {

}

// MARK: - Private
extension ContactsViewController {

}

// MARK: - Protocal
extension ContactsViewController: ContactsViewProtocol {

}
