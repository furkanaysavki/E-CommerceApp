//
//  WelcomeViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 24.05.2022.
//

import UIKit
import Lottie

class WelcomeViewController: UIViewController {
    
    var animationView = AnimationView()
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lottieInitialize()
        nextButton.layer.cornerRadius = 20
        
    }
    

   
    @IBAction func nextButton(_ sender: Any) {
        lottieStart()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.performSegue(withIdentifier: "toLoginView", sender: nil)
        self.lottieStop()
        }
    }
    
}
extension WelcomeViewController {
    func lottieInitialize(){
        animationView.isHidden = true
        animationView.animation = Animation.named("shopping" )
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 3
        animationView.backgroundColor = .white
        
        view.addSubview(animationView)
    }
    func lottieStart(){
        animationView.isHidden = false
        animationView.play()
    }
    
    func lottieStop(){
        animationView.isHidden = true
        animationView.stop()
    }


}

