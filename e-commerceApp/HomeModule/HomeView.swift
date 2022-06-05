//
//  HomeView.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import UIKit
import Kingfisher

class HomeView: UIViewController {
    
    
   
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var slideCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
   
    var homePresenter : ViewToPresenterHomeProtocol?
    
    var products : [Products] = []
    var filteredProducts : [Products] = []
    var slideImage = [UIImage(named: "image1")!, UIImage(named: "image2")!, UIImage(named: "image3")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        
        
        pageController.numberOfPages = slideImage.count
        
        activityIndicator.startAnimating()
       
        HomeRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homePresenter?.getProduct()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let product = sender as? Products
            let destinationVC = segue.destination as? DetailsViewController
            destinationVC!.product = product
            
        }
    }
}



extension HomeView : PresenterToViewHomeProtocol {
    
    
    
    
    
    func update(with products: [Products]) {
        self.products = products
        self.filteredProducts = products
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.collectionView.reloadData()
            
            
        }
        
    }
        func update(with error: String) {
                DispatchQueue.main.async {
                    self.products = []
                    
                }
            
        }
    }



extension HomeView : UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredProducts = self.products.filter { p in
            if p.title.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
       self.collectionView.reloadData()
    }
}
extension HomeView : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == slideCollectionView {
            return slideImage.count
        
        }
        
      
        return filteredProducts.count
   
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == slideCollectionView) {
            let cell2 = slideCollectionView.dequeueReusableCell(withReuseIdentifier: "slideCell", for: indexPath) as! SlideViewCell
            
            cell2.slideImage.image = slideImage[indexPath.row]
            
            cell2.layer.shadowColor = UIColor.lightGray.cgColor
            cell2.layer.shadowRadius = 5
            cell2.layer.shadowOpacity = 1
            cell2.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell2.layer.masksToBounds = false
            
            return cell2
            
        } else {
        
        
        
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! StoreCollectionViewCell
        let product = filteredProducts[indexPath.row]
        
         
        cell.nameLabel.text = product.title
        cell.priceLabel.text = "₺\(product.price)"
    
        
        if let url = URL(string: product.image) {
            DispatchQueue.main.async {
                cell.storeImageView.kf.setImage(with : url)
            }
        }
        
      
           
                
        cell.layer.cornerRadius = 17
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 5
        cell.layer.shadowOpacity = 1
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.masksToBounds = false
        
        
                
        
     
        return cell
       
        
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = filteredProducts[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: product)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            
            if collectionView == slideCollectionView
            {
                pageController.currentPage = indexPath.row
            }
            
        }
    }

