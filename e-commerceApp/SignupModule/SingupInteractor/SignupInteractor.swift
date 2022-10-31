//
//  SignupInteractor.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation
import Firebase


class SignupInteractor : PresenterToInteractorSignUpProtocol {
    
  func performRegisterRequest( email: String, password: String) {
        
            Auth.auth().createUser(withEmail: email, password: password){
                    (authdata, error) in
            if error != nil {
                               print("error")
                            } else {
                               print(".")
                                
                            }
                        }
                    
                    }
                    }
    
    

    
    

