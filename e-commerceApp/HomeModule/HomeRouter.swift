//
//  HomeRouter.swift
//  e-commerceApp
//
//  Created by Furkan Ayşavkı on 14.05.2022.
//

import Foundation

class HomeRouter : PresenterToRouterHomeProtocol {
    
    static func createModule(ref: HomeView) {
        
        let presenterr = HomePresenter()
        ref.homePresenter = presenterr
        ref.homePresenter?.homeInteractor = HomeInteractor()
        ref.homePresenter?.homeView = ref
        ref.homePresenter?.homeInteractor?.homePresenter = presenterr
    }
}
