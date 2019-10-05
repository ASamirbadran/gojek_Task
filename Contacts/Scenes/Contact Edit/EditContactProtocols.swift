//
//  EditContactProtocols.swift
//  Contacts
//
//  Created Ahmed Samir on 10/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation

// MARK: - ViewController -> Presenter

protocol EditContactPresenterProtocol: BasePresenterProtocol {

    //    var interactor: EditContactInteractorInputProtocol? { get set }

    /* ViewController -> Presenter */
}

protocol EditContactInteractorInputProtocol: class {

    //    var presenter: EditContactInteractorOutputProtocol? { get set }

    /* Presenter -> Interactor */
}

// MARK: - Interactor -> Presenter

protocol EditContactInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

// MARK: - Presenter -> ViewController

protocol EditContactViewProtocol: BaseViewProtocal {

    //    var presenter: EditContactPresenterProtocol? { get set }

    /* Presenter -> ViewController */
}

// MARK: - Router

protocol EditContactWireframeProtocol: class {

}
