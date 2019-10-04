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
}


private extension UIViewController {
    func editExtendedView( ) {
        self.edgesForExtendedLayout = [.top]
        self.extendedLayoutIncludesOpaqueBars = true

    }
}
