//
//  SeachCityPresenter.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

protocol SearchCityViewProtocol: class {
    
}

protocol SearchCityPresenterProtocol: class {
    
    var view: SearchCityViewProtocol! { get set }
    var router: SearchCityRouterProtocol! { get set }
    var networkService: NetworkServiceProtocol! { get set }
    
    func reloadWeatherWithCoords(lat: String, lon: String)
    func getCitiesData()
}

class SearchCityPresenter: SearchCityPresenterProtocol {
    
    weak var view: SearchCityViewProtocol!
    var router: SearchCityRouterProtocol!
    var networkService: NetworkServiceProtocol!
    
    func reloadWeatherWithCoords(lat: String, lon: String) {
        router.reloadWeatherWithCoords(lat: lat, lon: lon)
    }
    
    func getCitiesData() {
        DataManager.getCitiesArray()
    }
}
