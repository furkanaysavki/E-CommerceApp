//
//  CartView.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 21.05.2022.
//

import UIKit
import Kingfisher

class CartView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var selectedPrice = [String]()
    var selectedImage = [String]()
    var selectedCount = [String]()
    var selectedName =  [String]()
    var sum : Double = 0
  
    
    @IBOutlet weak var myTotalPrice: UILabel!
    
    @IBOutlet weak var payButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payButton.layer.cornerRadius = 20
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        newAmount()
        NotificationCenter.default.addObserver(self, selector: #selector(newAmount), name: NSNotification.Name(rawValue : "newData"), object: nil)
        
        }
    
    @objc func newAmount(){
        let numbers = selectedPrice.map { Double($0)!}
        let sum = numbers.reduce(0, +)
        myTotalPrice.text = String(sum)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toCell") as! CartTableViewCell
        
        cell.productName.text = selectedName[indexPath.row]
        cell.countLabel.text = selectedCount[indexPath.row]
        cell.priceLabel.text = selectedPrice[indexPath.row]
       
        
        if let url = URL(string: selectedImage[indexPath.row]) {
            DispatchQueue.main.async {
                cell.productImage.kf.setImage(with : url)
            }
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
            print("Deleted")

              self.selectedName.remove(at: indexPath.row)
              self.selectedPrice.remove(at: indexPath.row)
              self.selectedCount.remove(at: indexPath.row)
              self.selectedImage.remove(at: indexPath.row)
              self.tableView.deleteRows(at: [indexPath], with: .automatic)
              NotificationCenter.default.post(name: NSNotification.Name("newData"), object: nil)
              }
        }
    }

