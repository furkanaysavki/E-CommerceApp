//
//  WelcomeViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 24.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        nextButton.layer.cornerRadius = 20
        
    }
    

   
    @IBAction func nextButton(_ sender: Any) {
        self.performSegue(withIdentifier: "toLoginView", sender: nil)
        
    }
    
}
