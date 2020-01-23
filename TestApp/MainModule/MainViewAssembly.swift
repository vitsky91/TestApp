//
//  MainViewAssembly.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Swinject
import SwinjectStoryboard

class MainViewAssembly: Assembly {
    
    var network: NetworkServiceProtocol!
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func assemble(container: Container) {
        
        container.register(MainViewPresenter.self) { (r, viewController: MainViewController) in
            let presenter = MainViewPresenter()
            
            presenter.view = viewController
            presenter.networkService = self.network
            presenter.router = r.resolve(MainViewRouter.self, argument: viewController)

            return presenter
        }
        
        container.register(MainViewRouter.self) { (r, viewController: MainViewController) in
            let router = MainViewRouter()
            
            router.transitionHandler = viewController
            
            return router
        }

        container.storyboardInitCompleted(MainViewController.self) { r, viewController in

            viewController.presenter = r.resolve(MainViewPresenter.self, argument: viewController)

        }
        
    }
    
}
