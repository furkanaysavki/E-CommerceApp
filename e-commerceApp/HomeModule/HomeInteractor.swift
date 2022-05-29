//
//  HomeInteractor.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation


class HomeInteractor : PresenterToInteractorHomeProtocol {
   
    
   
   
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    func getAllProducts() {
        guard let url = URL(string: "https://fakestoreapi.com/products")
                else {
                    return
                }
                
                let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                    
                    
                    guard let data = data ,  error == nil else {
                        self?.homePresenter?.sendDataToPresenter(result: .failure(NetworkError.networkFailed))
                        return
                    }
                    
                    do {
                        
                        let products = try JSONDecoder().decode([Products].self, from : data )
                        
                        self?.homePresenter?.sendDataToPresenter(result: .success(products))
                        
                     
                    } catch {
                        self?.homePresenter?.sendDataToPresenter(result: .failure(NetworkError.parsingFailed))
                    }
                }
                task.resume()
        
}
}
