//
//  LoginProtocol.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import UIKit
import Foundation


protocol ViewToPresenterLoginProtocol {
    
    var LoginInteractor : PresenterToInteractorLoginProtocol? {get set}
    func clickLogin(email: String?, password: String?)
   
    
}

protocol PresenterToInteractorLoginProtocol{
    func performLoginRequest(email: String, password: String)
   
    
}

protocol PresenterToRouterLoginProtocol{
    
    static func createModule(ref: LoginView)
    
}




