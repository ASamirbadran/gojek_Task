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
    internal var presenter: EditContactPresenterProtocol?
    
    // MARK: - Private Variables
    var contactToEdit: ContactViewModel?
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak private var contactName: UILabel!
    @IBOutlet weak private var contactEmailTextField: UITextField!
    @IBOutlet weak private var contactPhoneTextField: UITextField!
    @IBOutlet weak private var contactCard: UIView!
    @IBOutlet weak private var contactLastNameTextField: UITextField!
    @IBOutlet weak private var contactFirsNameTextField: UITextField!
    
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
        setupNavigationBar(title: "")
        addDoneButton()
        setUpUi()
    }
}

// MARK: - IBActions
extension EditContactViewController {
    
}

// MARK: - Selectors
extension EditContactViewController {
    @objc
    func doneWasTapped() {
        contactToEdit?.editContact(
            fname: contactFirsNameTextField.text ?? "",
            lname: contactLastNameTextField.text ?? "",
            email: contactEmailTextField.text ?? "",
            phone: contactPhoneTextField.text ?? "")
        if let contact = contactToEdit {
            presenter?.editContact(contact: contact)
        }
    }
}

// MARK: - Private
extension EditContactViewController {
    func setUpUi() {
        self.contactImage.roundedImage()
        self.contactCard.setGradientBackground(colorTop: UIColor(red: 80 / 255, green: 227 / 255, blue: 194 / 255, alpha: 0.28), colorBottom: UIColor.white)
        if let contact = contactToEdit {
            contactImage.loadContactImage(imageUrl: contact.profilePic)
            contactName.text = contact.fullName
            contactEmailTextField.text = contact.email
            contactPhoneTextField.text = contact.phoneNumber
            contactFirsNameTextField.text = contact.firstName
            contactLastNameTextField.text = contact.lastName
        }
    }
    func addDoneButton() {
        
        let doneBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneWasTapped))
        self.navigationItem.rightBarButtonItem  = doneBarButtonItem
    }
}

// MARK: - Protocal
extension EditContactViewController: EditContactViewProtocol {
    func dismissVc() {
        self.navigationController?.popViewController(animated: true)
    }
}
