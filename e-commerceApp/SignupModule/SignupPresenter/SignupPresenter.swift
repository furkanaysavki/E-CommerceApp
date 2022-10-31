//
//  SignupPresenter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation
import UIKit

class SignupPresenter : ViewToPresenterSignUpProtocol {
  
    var signUpInteractor : PresenterToInteractorSignUpProtocol?
  
    func clickSignUp(email: String, password: String) {
        
    signUpInteractor?.performRegisterRequest(email: email, password: password)
       
    }
    }


