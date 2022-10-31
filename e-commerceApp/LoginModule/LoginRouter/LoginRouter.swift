//
//  LoginRouter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation
import UIKit


class LoginRouter :  PresenterToRouterLoginProtocol {
    
    static func createModule(ref : LoginView){
       
        ref.loginPresenter = LoginPresenter()
        ref.loginPresenter?.LoginInteractor = LoginInteractor()
        
        }
    }
