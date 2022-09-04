//
//  HomeView.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import UIKit
import Kingfisher

class HomeView: UIViewController {
    
    
    enum Section: Int, CaseIterable {
        case slide
        case products
        
    }
    
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
        configureCollectionView()
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
    
    func configureCollectionView() {
       
       collectionView.register(UINib(nibName: "SlideCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SlideCollectionViewCell")
        collectionView.register(UINib(nibName: "StoreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StoreCollectionViewCell")
        collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.dataSource = self
        collectionView.delegate = self
        }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { fatalError("no section at index ")}
            
            switch sectionKind {
            case .slide:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.bottom = 20
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.85), heightDimension: .absolute(230)), subitems: [item])
                group.contentInsets.leading = 10
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPaging
                section.visibleItemsInvalidationHandler = { (items, offset, environment) in
                    items.forEach { item in
                        let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                        let minScale: CGFloat = 0.8
                        let maxScale: CGFloat = 1.05
                        let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                        item.transform = CGAffineTransform(scaleX: scale, y: scale)
                    }
                }
                return section
            case .products:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 20
                item.contentInsets.bottom = 20
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitems: [item])
                group.contentInsets.leading = 20
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.top = 20
                section.orthogonalScrollingBehavior = .none
                section.visibleItemsInvalidationHandler = { (items, offset, environment) in
                    items.forEach { item in
                        let distanceFromCenter = abs((item.frame.midY - offset.y) - environment.container.contentSize.height / 2.0)
                        let minScale: CGFloat = 0.87
                        let maxScale: CGFloat = 1.1
                        let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.height), minScale)
                        item.transform = CGAffineTransform(scaleX: scale, y: scale)
                    }
                }
                return section
            }
            }
        return layout
    }
    }

extension HomeView : PresenterToViewHomeProtocol {
    
    func update(with products: [Products]) {
        self.products = products
        self.filteredProducts = products
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
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
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let section = Section(rawValue: section) else {fatalError("")}
        switch section {
        case .slide:
            return slideImage.count
        case .products:
            return filteredProducts.count
        }
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let sectionKind = Section(rawValue: indexPath.section) else {fatalError("")}
        switch sectionKind {
        case .slide:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SlideCollectionViewCell", for: indexPath) as! SlideCollectionViewCell
            
            cell.slideImage.image = slideImage[indexPath.row]
            cell.layer.shadowColor = UIColor.lightGray.cgColor
            cell.layer.shadowRadius = 5
            cell.layer.shadowOpacity = 1
            cell.layer.shadowOffset = CGSize(width: 0, height: 0)
            cell.layer.masksToBounds = false
            
            return cell
        case .products:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCollectionViewCell", for: indexPath) as! StoreCollectionViewCell
            
             let product = filteredProducts[indexPath.row]
             cell.nameLabel.text = product.title
             cell.priceLabel.text = "₺\(product.price)"
             
             if let url = URL(string: product.image) {
                 DispatchQueue.main.async {
                     cell.storeImageView.kf.setImage(with : url)
                 }
             }
        return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let product = filteredProducts[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: product)
        
        
    }
    
            
        }
    

