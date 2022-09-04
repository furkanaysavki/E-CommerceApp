//
//  ProfileRouter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 29.05.2022.
//

import Foundation

class ProfileRouter : PresenterToRouterProfileProtocol {
    static func createModule(ref: ProfileViewController) {
        
        
        let presenter = ProfilePresenter()
        ref.profilePresenter = presenter
        ref.profilePresenter?.profileInteractor = ProfileInteractor()
        ref.profilePresenter?.profileView = ref
        ref.profilePresenter?.profileInteractor?.profilePresenter = presenter 
    }
}
