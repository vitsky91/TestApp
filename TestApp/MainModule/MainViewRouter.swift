//
//  MainViewRouter.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import LightRoute

protocol MainViewRouterProtocol {
    func showSearchCityView()
    func showMap()
}

final class MainViewRouter: MainViewRouterProtocol {
    
    weak var transitionHandler: TransitionHandler!
    
    func showSearchCityView() {
        
        try? transitionHandler.forCurrentStoryboard(restorationId: "Search", to: SearchCityViewProtocol.self).to(preferred: .default).perform()
        
    }
    
    func showMap() {
        try? transitionHandler.forCurrentStoryboard(restorationId: "Map", to: SearchCityViewProtocol.self).to(preferred: .default).perform()
        
    }
    
}
