//
//  ContactDetailsInteractor.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

class ContactDetailsInteractor {

    internal weak var presenter: ContactDetailsInteractorOutputProtocol?

    // MARK: - Custom Setter
    public func setPresenter (presenter: ContactDetailsInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension ContactDetailsInteractor: ContactDetailsInteractorInputProtocol {
    func saveIsFavorite(id: Int, isFavorite: Bool) {
        NetworkManager.shared?.setIsFavorite(Id: id, isFavorite: isFavorite,  completion: { (result: Result<Data, NetworkError>, statusCode) in
            switch result {
            case .success:
                self.presenter?.isFavoritedSuccessfully()
            case .failure(let error):
                self.presenter?.errorSavingFavoriteState(
                    title: L10n.error,
                    errorMessage: "\(error.message ?? "smth went wrong") \(error.code ?? 0)")
            }
        })
    }
    
    func fetchUserDetails(url: String) {
        NetworkManager.shared?.getSpecificContact(url: url, completion: { (result: Result<Contact, NetworkError>, statusCode) in
            switch result {
            case .success(let contact):
                self.presenter?
                    .userDetailsFetchedSuccessfully(fetchedContact: contact)
            case .failure(let error):
                self.presenter?.errorFetchingContactDetails(
                    title: L10n.error,
                    errorMessage: "\(error.message ?? "smth went wrong") \(error.code ?? 0)")
                
            }
        })
    }
    

}
