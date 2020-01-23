//
//  MapAssembler.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/23/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Swinject

class MapAssembler: Assembly {
    
    var network: NetworkServiceProtocol!
    
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    func assemble(container: Container) {
        
        container.register(MapPresenter.self) { (r, viewController: MapViewController) in
            
            let presenter = MapPresenter()
            
            presenter.network = self.network
            presenter.view = viewController
            presenter.router = r.resolve(MapRouter.self, argument: viewController)

            return presenter
        }
        
        container.register(MapRouter.self) { (r, viewController: MapViewController) in
            
            let router = MapRouter()
            
            router.transitionHandler = viewController
            
            return router
        }

        container.storyboardInitCompleted(MapViewController.self) { r, viewController in

            viewController.presenter = r.resolve(MapPresenter.self, argument: viewController)

        }
        
    }
}
