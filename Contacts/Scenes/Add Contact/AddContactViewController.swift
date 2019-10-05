//
//  AddContactViewController.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class AddContactViewController: BaseViewController {
    
    // MARK: - Public Variables
    internal var presenter: AddContactPresenterProtocol?
    
    // MARK: - Private Variables
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak private var contactEmailTextField: UITextField!
    @IBOutlet weak private var contactPhoneTextField: UITextField!
    @IBOutlet weak private var contactCard: UIView!
    @IBOutlet weak private var contactLastNameTextField: UITextField!
    @IBOutlet weak private var contactFirsNameTextField: UITextField!
    // MARK: - Custom Setter
    public func setPresenter (presenter: AddContactPresenterProtocol) {
        self.presenter = presenter
    }
}

// MARK: - View controller lifecycle methods
extension AddContactViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
        addDoneButton()
        setupNavigationBar(title: "")
        setUpUi()
    }
}

// MARK: - IBActions
extension AddContactViewController {
    
    
}

// MARK: - Selectors
extension AddContactViewController {
    @objc
    func doneWasTapped() {
        let contactToSave = Contact(fname: contactFirsNameTextField.text ?? "", lname: contactLastNameTextField.text ?? "", email: contactEmailTextField.text ?? "", phone: contactPhoneTextField.text ?? "")
        presenter?.addContact(contact: contactToSave)
    }
    
}

// MARK: - Private
extension AddContactViewController {
    func addDoneButton() {
        
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneWasTapped))
        self.navigationItem.rightBarButtonItem  = doneBarButtonItem
    }
    func setUpUi() {
        contactImage.roundedImage()
        self.contactCard.setGradientBackground(colorTop: UIColor(red: 80 / 255, green: 227 / 255, blue: 194 / 255, alpha: 0.28), colorBottom: UIColor.white)
    }
}

// MARK: - Protocal
extension AddContactViewController: AddContactViewProtocol {
    
    
}
