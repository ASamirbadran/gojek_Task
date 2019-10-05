//
//  UiImage.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import UIKit
extension UIImageView {
    func roundedImage() {
           self.layer.cornerRadius = self.frame.size.height/2
           self.clipsToBounds = true
       }
    
    func loadContactImage(imageUrl: String) {
         let imageUrl = URL(string: imageUrl)
         self.kf.setImage(
             with: imageUrl,
             placeholder: Asset.placeholderPhoto.image,
             options: [
                 .scaleFactor(UIScreen.main.scale),
                 .transition(.fade(1)),
                 .cacheOriginalImage
             ])
     }
}
