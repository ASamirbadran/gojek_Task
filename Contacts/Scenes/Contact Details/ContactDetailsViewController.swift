//
//  ContactDetailsViewController.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

class ContactDetailsViewController: BaseViewController {

    // MARK: - Public Variables
    internal var presenter: ContactDetailsPresenterProtocol?

    // MARK: - Private Variables
    var userDetailsUrl: String?
    var isContactFavorite: Bool?
    
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
        presenter?.getUserDetails(url: userDetailsUrl ?? "" )
    }
}

// MARK: - IBActions
extension ContactDetailsViewController {
    @IBAction func messageButtonDidTapped(_ sender: Any) {
        
     }
     @IBAction func favoriteButtonDidTapped(_ sender: Any) {
        presenter?.changeIsFavorite(isFavorite: !(isContactFavorite ?? false))
     }
    
     
     @IBAction func emailButtonDidTapped(_ sender: Any) {
        
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

        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editWasTapped))
        self.navigationItem.rightBarButtonItem  = editBarButtonItem
    }
    
   func loadContactImage(imageUrl: String) {
        let imageUrl = URL(string: imageUrl)
        self.contactImageView.kf.setImage(
            with: imageUrl,
            placeholder: Asset.placeholderPhoto.image,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }

}

// MARK: - Protocal
extension ContactDetailsViewController: ContactDetailsViewProtocol {
    func loadData(fetchedContact: Contact) {
        self.phoneNumberLabel.text = fetchedContact.phoneNumber
        self.emailLabel.text = fetchedContact.email
        checkIsFavorite(isFavorite: fetchedContact.favorite ?? false)
        loadContactImage(imageUrl: fetchedContact.profilePic ?? "")
        self.contactName.text = fetchedContact.firstName ?? ""
    }
    

}
