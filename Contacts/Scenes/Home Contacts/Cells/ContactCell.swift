//
//  ContactCell.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol ContactCellDelegate: class {
}

class ContactCell: UITableViewCell, ContactCellView {
    @IBOutlet weak var contactPhotoView: UIImageView!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var contactFavouriteImageView: UIImageView!
    private weak var delegate: ContactCellDelegate?
    
    private var cellIndex: Int?
    private var sectionIndex: Int?


    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        contactPhotoView.roundedImage()

      }
    
    func setDelegate(delegate: ContactCellDelegate) {
        self.delegate = delegate
    }
    
    func configureContactCell(viewModel: ContactViewModel, sectionIndex: Int, rowIndex: Int) {
        self.cellIndex = rowIndex
        self.sectionIndex = sectionIndex
        self.contactNameLabel.text = viewModel.fullName
        if(viewModel.favorite) {
            self.contactFavouriteImageView.isHidden = false
        } else {
            self.contactFavouriteImageView.isHidden = true
        }
        loadContactImage(imageUrl: viewModel.profilePic)
    }
    
}



extension ContactCell {
    func loadContactImage(imageUrl: String) {
        let imageUrl = URL(string: imageUrl)

        self.contactPhotoView.kf.setImage(
            with: imageUrl,
            placeholder: Asset.placeholderPhoto.image,
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }
}
