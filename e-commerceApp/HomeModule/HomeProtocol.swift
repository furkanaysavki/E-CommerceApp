//
//  HomeProtocol.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    
    var homeInteractor : PresenterToInteractorHomeProtocol? {get set}
    
    var homeView : PresenterToViewHomeProtocol? {get set}
    func getProduct()
 
}

protocol PresenterToInteractorHomeProtocol {
    
    var homePresenter : InteractorToPresenterHomeProtocol? {get set}
    func getAllProducts()
    
    
}

protocol InteractorToPresenterHomeProtocol {
    
    func sendDataToPresenter(result: Result<[Products], Error>)
    
    
}

protocol PresenterToViewHomeProtocol {
   
    func update(with products: [Products])
    func update(with error: String)
    
}

protocol PresenterToRouterHomeProtocol {
    
    static func createModule(ref : HomeView)
}
