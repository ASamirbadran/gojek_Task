//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit
import MessageUI

class ContactDetailsViewController: BaseViewController {

    // MARK: - Public Variables
    internal var presenter: ContactDetailsPresenterProtocol?

    // MARK: - Private Variables
    var userDetailsUrl: String?
    var isContactFavorite: Bool?
    var editBarButtonItem: UIBarButtonItem?
    // MARK: - Computed Variables

    // MARK: - IBOutlets
    
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak private var contactCardView: UIView!
    @IBOutlet weak private var contactImageView: UIImageView!
    @IBOutlet weak private var contactName: UILabel!
    @IBOutlet weak private var favouriteButton: UIButton!
    @IBOutlet weak private var phoneNumberLabel: UILabel!
    @IBOutlet weak private var emailLabel: UILabel!

    // MARK: - Custom Setter
    public func setPresenter (presenter: ContactDetailsPresenterProtocol) {
        self.presenter = presenter
        
    }
}

// MARK: - View controller lifecycle methods
extension ContactDetailsViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad?()
        setupNavigationBar(title: "")
        setUpUi()
        addEditButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.getUserDetails(url: userDetailsUrl ?? "" )

    }
}

// MARK: - IBActions
extension ContactDetailsViewController {
    @IBAction func messageButtonDidTapped(_ sender: Any) {
        guard let number = URL(string: "sms:" + (presenter?.fetchedContact.phoneNumber ?? "")) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
        
     }
     @IBAction func favoriteButtonDidTapped(_ sender: Any) {
        presenter?.changeIsFavorite(isFavorite: !(isContactFavorite ?? false))
     }
    
     
     @IBAction func emailButtonDidTapped(_ sender: Any) {
        let email = presenter?.fetchedContact.email ?? ""
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            present(mail, animated: true, completion: nil)
        } else {
            print("Cannot send mail")
        }
        
     }
     @IBAction func callButtonDidTapped(_ sender: Any) {
        guard let number = URL(string: "tel://" + (presenter?.fetchedContact.phoneNumber ?? "")) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)
     }
}

// MARK: - Selectors
extension ContactDetailsViewController {
    @objc
    func editWasTapped() {
        guard let contact = presenter?.fetchedContact else {
            return
        }
        presenter?.editContact(contact: contact)

    }
}

// MARK: - Private
extension ContactDetailsViewController {
    func setUpUi() {
        self.contactImageView.roundedImage()
        self.contactCardView.setGradientBackground(colorTop: UIColor(red: 80 / 255, green: 227 / 255, blue: 194 / 255, alpha: 0.28), colorBottom: UIColor.white)
    }
    
    func checkIsFavorite(isFavorite: Bool) {
        if(isFavorite) {
            self.isContactFavorite = true
            self.favouriteButton.setImage(Asset.favouriteButtonSelected.image, for: .normal)
        } else {
            self.isContactFavorite = false
            self.favouriteButton.setImage(Asset.favouriteButton.image, for: .normal)
        }
        
    }
    func addEditButton() {

        editBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editWasTapped))
        self.navigationItem.rightBarButtonItem  = editBarButtonItem
        editBarButtonItem?.isEnabled = false
    }
    

}

// MARK: - Protocal
extension ContactDetailsViewController: ContactDetailsViewProtocol {
    func loadData(fetchedContact: Contact) {
        self.phoneNumberLabel.text = fetchedContact.phoneNumber
        self.emailLabel.text = fetchedContact.email
        checkIsFavorite(isFavorite: fetchedContact.favorite ?? false)
        contactImageView.loadContactImage(imageUrl: fetchedContact.profilePic ?? "")
        self.contactName.text = fetchedContact.firstName ?? ""
        editBarButtonItem?.isEnabled = true

    }
    

}



extension ContactDetailsViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
