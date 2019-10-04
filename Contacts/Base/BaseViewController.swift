//
//  BaseViewController.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/4/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import UIKit
import SwiftMessages

class BaseViewController: UIViewController {
    
    // MARK: - Public Variables
    
    // MARK: - Private Variables
    
    // MARK: - Computed Variables
    
    // MARK: - IBOutlets
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Base")
    }
    /// use this if you add a ViewControllerScene to the Nib not a View
    static func loadViewControllerFromXib<Controller: BaseViewController>() -> Controller {
        let nib = UINib(nibName: String(describing: self), bundle: Bundle.main)
        guard let controller = nib.instantiate(withOwner: nil, options: nil).first as? Controller
            else {
                fatalError("failed to parse top level object in nib to \(String(describing: Controller.self))")
        }
        return controller
    }
    func setupNavigationBar(title: String, prefersLargeTitles: Bool = true) {
        self.navigationItem.title = title
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        } else {
            // Fallback on earlier versions
        }

        if #available(iOS 11.0, *) {
            self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        } else {
            // Fallback on earlier versions
        }
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        } else {
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        }
    }
    
    func showMessage(title: String, body: String) {
        let warning = MessageView.viewFromNib(layout: .cardView)
        warning.configureTheme(.error)
        warning.configureDropShadow()
        
        warning.configureContent(title: title, body: body)
        warning.button?.isHidden = true
        var warningConfig = SwiftMessages.defaultConfig
        warningConfig.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: warningConfig, view: warning)
    }
    
}

extension BaseViewController:  ViewIndicatorProtocal, Toastermessages {
    
    func showToastMessage(title: String, body: String) {
        showMessage(title: title, body: title)
    }
    
    func showLoadingIndicator() {
        Loader.show(onView: self.view)

    }
    
    func hideLoadingIndicator() {
        Loader.hide()
    }
    
}
