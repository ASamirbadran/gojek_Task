//
//  SortTableSections.swift
//  Contacts
//
//  Created by Ahmed Samir on 10/5/19.
//  Copyright © 2019 GoJek. All rights reserved.
//

import UIKit
class SortTableSections {
    class func sortContacBySection(contactListViewModels: [ContactViewModel]) -> [ContactTableSection] {
        let sortedContacts = contactListViewModels.sorted(by: { $0.fullName < $1.fullName })
        
        let sectionTitles = UILocalizedIndexedCollation.current().sectionTitles
        
        var calculatingSections: [ContactTableSection] = []
        
        for title in sectionTitles {
            let contacts = sortedContacts.filter({ $0.fullName.capitalized.hasPrefix(title)})
            let section = ContactTableSection(sectionTitle: title, contacts: contacts)
            calculatingSections.append(section)
        }
        return calculatingSections
    }
}
