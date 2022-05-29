//
//  ProfileProtocol.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 29.05.2022.
//

import Foundation

protocol ViewToPresenterProfileProtocol {
    
    var profileInteractor : PresenterToInteractorProfileProtocol? {get set}
    var profileView : PresenterToViewProfileProtocol? {get set}
    func getInfo()
}

protocol PresenterToInteractorProfileProtocol {
    
    var profilePresenter : InteractorToPresenterProfileProtocol? {get set}
    func getData()
    
    
}
protocol PresenterToViewProfileProtocol {
    
    func infoToView(email : String)
    
}

protocol InteractorToPresenterProfileProtocol {
    
    func infoToPresenter(email : String)
}



protocol PresenterToRouterProfileProtocol {
    
    static func createModule (ref : ProfileViewController)
}

