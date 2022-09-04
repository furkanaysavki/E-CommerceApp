//
//  ProfilePresenter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 29.05.2022.
//

import Foundation

class ProfilePresenter : ViewToPresenterProfileProtocol {
    
    
    var profileView : PresenterToViewProfileProtocol?
    var profileInteractor : PresenterToInteractorProfileProtocol?
    
    func getInfo(){
        
        profileInteractor?.getData()
    }
}
    
    extension ProfilePresenter : InteractorToPresenterProfileProtocol {
        
        func infoToPresenter(email : String) {
        
            profileView!.infoToView(email: email)
    }
}

