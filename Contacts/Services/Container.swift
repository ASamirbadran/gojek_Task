//
//  Container.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

//include all View Controller initializer
import UIKit

class Container {
    
    class func setRootViewController(_ viewController: UIViewController) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.window?.rootViewController = viewController
        appDelegate.window?.makeKeyAndVisible()
    }
    
    class func embedVCInNavController(_ viewController: UIViewController) -> UIViewController {
          let nav = AppNavigationController(rootViewController: viewController)
          return nav
      }

    class func getHomeScreen() -> ContactsViewController {
         guard let homeVC = ContactsRouter.createModule() as? ContactsViewController else {
                   return ContactsViewController()
               }
               homeVC.editExtendedView()
               return homeVC
    }
    
    class func getContactDetailsScreen(contactUrl: String) -> ContactDetailsViewController {
        guard let contactDetailsVC = ContactDetailsRouter.createModule() as? ContactDetailsViewController else {
            return ContactDetailsViewController()
        }
        contactDetailsVC.userDetailsUrl = contactUrl
        contactDetailsVC.editExtendedView()
        return contactDetailsVC
    }
    
    class func getEditContactScreen(contactToEdit: ContactViewModel) -> EditContactViewController {
         guard let editContactVC = EditContactRouter.createModule() as? EditContactViewController else {
             return EditContactViewController()
         }
         editContactVC.contactToEdit = contactToEdit
         editContactVC.editExtendedView()
         return editContactVC
     }
    
    class func getAddContactScreen() -> AddContactViewController {
        guard let addContactVC = AddContactRouter.createModule() as? AddContactViewController else {
            return AddContactViewController()
        }
        addContactVC.editExtendedView()
        return addContactVC
    }
    
}


private extension UIViewController {
    func editExtendedView( ) {
        self.edgesForExtendedLayout = [.top]
        self.extendedLayoutIncludesOpaqueBars = true

    }
}
