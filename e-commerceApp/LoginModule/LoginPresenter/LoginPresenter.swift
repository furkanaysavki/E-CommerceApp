//
//  LoginPresenter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation
import UIKit





class LoginPresenter : ViewToPresenterLoginProtocol {
    
    var LoginInteractor: PresenterToInteractorLoginProtocol?
    
   
    
    
    
    
   
    
    func clickLogin(email: String?, password: String?) {
        
       
        LoginInteractor?.performLoginRequest(email: email!, password: password!)

            }
    
}




