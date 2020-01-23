//
//  SearchCityRouter.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import LightRoute

protocol SearchCityRouterProtocol {
    
    func reloadWeatherWithCoords(lat: String, lon: String)
}

class SearchCityRouter: SearchCityRouterProtocol {
    
    weak var transitionHandler: TransitionHandler!
    
    func reloadWeatherWithCoords(lat: String, lon: String) {
        
//        try? transitionHandler.forCurrentStoryboard(restorationId: "Main", to: MainViewControllerProtocol.self).then({ (module) -> Any? in
//
//            module.reloadWeatherWithCoords(lat: lat, lon: lon)
//        })

    }
    
}
