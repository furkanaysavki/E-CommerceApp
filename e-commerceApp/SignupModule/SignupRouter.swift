//
//  SignupRouter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation




class SignupRouter :  PresenterToRouterSignUpProtocol {
    
    static func createModule(ref : SignupView){
       
        
        
        ref.signUpPresenter = SignupPresenter()
        ref.signUpPresenter?.signUpInteractor = SignupInteractor()
     
        
  
    
    
        
        
    }
    
}

