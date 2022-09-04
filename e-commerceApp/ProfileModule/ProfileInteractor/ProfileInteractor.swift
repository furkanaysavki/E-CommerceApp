//
//  ProfileInteractor.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 29.05.2022.
//

import Foundation
import Firebase

class ProfileInteractor : PresenterToInteractorProfileProtocol {
    
    var profilePresenter : InteractorToPresenterProfileProtocol?
    
    
    func getData() {
        
        let email = Auth.auth().currentUser?.email
        profilePresenter!.infoToPresenter(email : email!)
    }
}

