//
//  DetailsViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 15.05.2022.
//

import UIKit
import Kingfisher
import Lottie

class DetailsViewController: UIViewController {
    
    var product : Products?
    var count : Double = 1
    var animationView = AnimationView()
    
    
    @IBOutlet weak var addButtonClicked: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButtonClicked.layer.cornerRadius = 20
        lottieInitialize()
        productName.text = product?.title
        productDescription.text = product?.Description
        sumLabel.text = "\(product!.price)"
  
        
        
        
        if let url = URL(string : product!.image)
                   {
                       DispatchQueue.main.async {
                           self.productImage.kf.setImage(with : url)
                       }
                   }
        
        
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
        if count >= 1 && count < 10
                {
                    count += 1
                }
                countLabel.text = "\(Int(count))"
                
                
        let price = Double(product!.price)
        sumLabel.text = "\(price * count)"
        
        
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        if count > 1 && count < 10
               {
                   count -= 1
               }
               countLabel.text = "\(Int(count))"
        let price = Double(product!.price)
        sumLabel.text = "\(price * count)"
        }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        lottieStart()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        let secondTab = (self.tabBarController?.viewControllers![1])! as! CartView
            secondTab.selectedName.append(self.product!.title)
            secondTab.selectedImage.append(self.product!.image)
            secondTab.selectedCount.append(self.countLabel.text!)
            secondTab.selectedPrice.append(self.sumLabel.text!)
            self.lottieStop()
            NotificationCenter.default.post(name: NSNotification.Name("tabBarCount"), object: nil)
        
        }
        
    }

}
extension DetailsViewController {
    func lottieInitialize(){
        animationView.isHidden = true
        animationView.animation = Animation.named("addToCart" )
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

