//
//  ViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 13.05.2022.
//

import Foundation
import UIKit
import Firebase





class LoginView: UIViewController {
  
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    var loginPresenter : ViewToPresenterLoginProtocol?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 20
        passwordText.isSecureTextEntry = true
        LoginRouter.createModule(ref: self)
        
    }

    @IBAction func signupButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    
   
    @IBAction func loginButton(_ sender: Any) {
    
    

                
                
        loginPresenter?.clickLogin(email: emailText.text!, password: passwordText.text!)
                
                
        if emailText.text != "" && passwordText.text != "" {
                    
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (authdata, error) in
                        if error != nil {
                            let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Error", preferredStyle: .alert)
                            let OKAction = UIAlertAction(title: "Ok", style: .default)
                            alert.addAction(OKAction)
                            self.present(alert, animated: true)

                        } else {
                           
                            self.performSegue(withIdentifier: "toTabBar", sender: nil)
                         
                        }

                    }
                } else {
                    let alert = UIAlertController(title: "Error", message:"username/password ?", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "Ok", style: .default)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true)
                }
            }
}

 
    

