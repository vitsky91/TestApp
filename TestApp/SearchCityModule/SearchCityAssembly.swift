//
//  SearchCityAssembly.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Swinject

class SearchCityAssembly: Assembly {
    
    var network: NetworkServiceProtocol!
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func assemble(container: Container) {
        
        container.register(SearchCityPresenter.self) { (r, viewController: SearchCityViewController) in
            
            let presenter = SearchCityPresenter()
            
            presenter.networkService = self.network
            presenter.view = viewController
            presenter.router = r.resolve(SearchCityRouter.self, argument: viewController)

            return presenter
        }
        
        container.register(SearchCityRouter.self) { (r, viewController: SearchCityViewController) in
            
            let router = SearchCityRouter()
            
            router.transitionHandler = viewController
            
            return router
        }

        container.storyboardInitCompleted(SearchCityViewController.self) { r, viewController in

            viewController.presenter = r.resolve(SearchCityPresenter.self, argument: viewController)

        }
        
    }
    
}
