//
//  SignupView.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import UIKit

class SignupView: UIViewController {

    var signUpPresenter : ViewToPresenterSignUpProtocol?

    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            signup.layer.cornerRadius = 20
            passwordText.isSecureTextEntry = true

            SignupRouter.createModule(ref: self)
        }
        
       
    @IBAction func signup(_ sender: Any) {
    
    signUpPresenter!.clickSignUp(email: emailText.text!, password: passwordText.text!)
        let alert = UIAlertController(title: "WELCOME", message: "Signing up is Successful", preferredStyle: .alert)
                
                let okayAction = UIAlertAction(title: "Okay", style: .default)
                {
                    action in
                    
                    self.performSegue(withIdentifier: "toLogin", sender: nil)
                }
                
                alert.addAction(okayAction)
                self.present(alert, animated: true)
    }
    @IBAction func login(_ sender: Any) {
        self.performSegue(withIdentifier: "toLogin", sender: nil)
        
    }
    
        
        
        
        
    }
