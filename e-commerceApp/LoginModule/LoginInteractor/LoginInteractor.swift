//
//  LoginInteractor.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation
import Firebase




class LoginInteractor : PresenterToInteractorLoginProtocol {
   
   
    
    func performLoginRequest(email: String, password: String) {
         
            
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
                
            }
                        }
                    
                    }

                  
                    
                    
                
