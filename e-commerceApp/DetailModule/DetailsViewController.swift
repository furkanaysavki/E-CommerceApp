//
//  DetailsViewController.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 15.05.2022.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    
    var product : Products?
    var count : Int = 1
    
    
    
    @IBOutlet weak var addButtonClicked: UIButton!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addButtonClicked.layer.cornerRadius = 20
        
        
        
        
        
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
                countLabel.text = "\(count)"
                
                
        let price = Int(product!.price)
        sumLabel.text = "\(price * count)"
        
        
    }
    
    
    @IBAction func minusButton(_ sender: Any) {
        if count > 1 && count < 10
               {
                   count -= 1
               }
               countLabel.text = "\(count)"
        let price = Int(product!.price)
        sumLabel.text = "\(price * count)"
        
               
             
               
                   
               
           
    }
    
    
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let secondTab = (self.tabBarController?.viewControllers![1])! as! CartView
        secondTab.selectedName.append(product!.title)
        secondTab.selectedImage.append(product!.image)
        secondTab.selectedCount.append(countLabel.text!)
        secondTab.selectedPrice.append(sumLabel.text!)
        
        
        
        
        
    }



}
