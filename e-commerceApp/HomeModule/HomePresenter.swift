//
//  HomePresenter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation

enum NetworkError : Error {
    case networkFailed
    case parsingFailed
}

class HomePresenter : ViewToPresenterHomeProtocol {
    
    var homeInteractor: PresenterToInteractorHomeProtocol?
   
    var homeView: PresenterToViewHomeProtocol?
    
    
    func getProduct() {
        homeInteractor?.getAllProducts()
        
        
    }
    
}

extension HomePresenter : InteractorToPresenterHomeProtocol {
    func sendDataToPresenter(result: Result<[Products], Error>) {
        
                switch result {
                    case .success(let products):
                    homeView!.update(with: products)
                    case .failure(_):
                    homeView!.update(with: "Try again later")
                }
            }
    
}
