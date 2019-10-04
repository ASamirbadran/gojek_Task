//
//  ContactsPresenter.swift
//  Contacts
//
//  Created Ahmed Samir on 10/4/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import UIKit //TEST FOR NOW ------

class ContactsPresenter: NSObject {

    private weak var view: ContactsViewProtocol?
    internal var interactor: ContactsInteractorInputProtocol?
    private var router: ContactsWireframeProtocol?
    var contactaListViewModels = [ContactViewModel] ()
    
    var contactTableSections: [ContactTableSection] = []


    init(interface: ContactsViewProtocol,
         interactor: ContactsInteractorInputProtocol?,
         router: ContactsWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
extension ContactsPresenter: ContactsPresenterProtocol {
    func getUserDetails(section: Int, row: Int) {
        let userDataUrl = contactTableSections[section].contacts[row].url
        router?.openContactDetailsScreen(contactUrl: userDataUrl)
    }
    
    func configure(cell: ContactCellView, sectionIndex: Int, rowIndex: Int) {
        let contactEntryViewModel = contactTableSections[sectionIndex].contacts[rowIndex]
        cell.configureContactCell(viewModel: contactEntryViewModel, sectionIndex: sectionIndex, rowIndex: rowIndex)
        cell.setDelegate(delegate: self)
    }
    
    var contactTableData: [ContactTableSection] {
        return contactTableSections
    }
    
    func getContacts() {
        view?.showLoadingIndicator?()
        interactor?.fetchContacts()
    }
    func mapContactsToViewModel(contactList: [Contact]) {
        self.contactaListViewModels = contactList.map { (contact) -> ContactViewModel in
            let viewModel = ContactViewModel(contact: contact)
            return viewModel
        }
        
        //arrange conatct into sections
        mapDataToSections(contactListViewModels: contactaListViewModels)
    }
    func mapDataToSections(contactListViewModels: [ContactViewModel]) {
        let sortedContacts = contactListViewModels.sorted(by: { $0.fullName < $1.fullName })

        let sectionTitles = UILocalizedIndexedCollation.current().sectionTitles

        var calculatingSections: [ContactTableSection] = []

        for title in sectionTitles {
            let contacts = sortedContacts.filter({ $0.fullName.capitalized.hasPrefix(title)})
            let section = ContactTableSection(sectionTitle: title, contacts: contacts)
            calculatingSections.append(section)
        }
        self.contactTableSections = calculatingSections
        view?.reloadData()
    }
}
extension ContactsPresenter: ContactsInteractorOutputProtocol {
    func contactFetchedSuccessfully(contactList: [Contact]) {
        view?.hideLoadingIndicator?()
        mapContactsToViewModel(contactList: contactList)
    }
    
    func errorFetchingContacts(title: String, errorMessage: String) {
        view?.hideLoadingIndicator?()
        view?.showToastMessage?(title: title, body: errorMessage)
    }
}

extension ContactsPresenter: ContactCellDelegate {

}
