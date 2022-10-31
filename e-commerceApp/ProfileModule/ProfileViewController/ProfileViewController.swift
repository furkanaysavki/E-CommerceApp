//
//  ProfileViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 23.05.2022.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    @IBOutlet weak var usersemail: UILabel!
    
    var profilePresenter : ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileRouter.createModule(ref: self)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        profilePresenter?.getInfo()
        }
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
                    try Auth.auth().signOut()
                    self.performSegue(withIdentifier: "logOut", sender: nil)
                    
                } catch {
                    print("error")
                }
    }
}
extension ProfileViewController : PresenterToViewProfileProtocol {
    
    func infoToView(email : String){
    
    self.usersemail.text = email
    }
}
