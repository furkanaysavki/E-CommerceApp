//
//  SignupProtocol.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import UIKit
import Foundation


protocol ViewToPresenterSignUpProtocol {
    
    var signUpInteractor : PresenterToInteractorSignUpProtocol? {get set}
    
    func clickSignUp(email: String, password: String)
    
}

protocol PresenterToInteractorSignUpProtocol{
    func performRegisterRequest(email: String, password: String)
}

protocol PresenterToRouterSignUpProtocol{
    
    static func createModule(ref: SignupView)
}


