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
        setupNavigationBar(title: "Contacts")
        setupContactsTableView()
        addAddButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //getting contactList
        presenter?.getContacts()
    }
}

// MARK: - IBActions
extension ContactsViewController {

}

// MARK: - Selectors
extension ContactsViewController {
    @objc
    func addWasTapped() {
        self.navigationController?.pushViewController(Container.getAddContactScreen(), animated: true)
    }

}

// MARK: - Private
extension ContactsViewController {
    func setupContactsTableView() {
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(
            UINib (nibName: ContactCell.className, bundle: Bundle(for: ContactCell.self)),
            forCellReuseIdentifier: ContactCell.className)
        
        contactsTableView.separatorStyle = .none
    }

    func addAddButton() {
        let addBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addWasTapped))
           self.navigationItem.rightBarButtonItem  = addBarButtonItem
       }
}

// MARK: - Protocal
extension ContactsViewController: ContactsViewProtocol {
    func reloadData() {
        contactsTableView.reloadData()
    }
}

extension ContactsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter?.contactTableData.count ?? 0
     }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.contactTableData[section].contacts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if presenter?.contactTableData[section].contacts.count == 0 {
            return nil
        }
        return presenter?.contactTableData[section].sectionTitle
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return presenter?.contactTableData.compactMap({ $0.sectionTitle })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.getUserDetails(section: indexPath.section, row: indexPath.row)
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ContactCell.className,
            for: indexPath) as? ContactCell else {
                fatalError("ContactCell fatal error")
        }
        presenter?.configure(cell: cell, sectionIndex: indexPath.section, rowIndex: indexPath.row)
        return cell
    }
    
    
}
