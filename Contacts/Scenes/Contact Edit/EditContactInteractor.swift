//
//  EditContactInteractor.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class EditContactInteractor {

    private weak var presenter: EditContactInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: EditContactInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension EditContactInteractor: EditContactInteractorInputProtocol {

}
