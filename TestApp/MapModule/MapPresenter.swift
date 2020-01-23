//
//  MapPresenter.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/23/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

protocol MapViewProtocol: class {
    
}

protocol MapPresenterProtocol: class {
    
    var view: MapViewProtocol! {get set}
    var network: NetworkServiceProtocol! {get set}
    var router: MapRouterProtocol! {get set}
    
    var pickedLatitude: Double {get set}
    var pickedLongtitude: Double {get set}
}

class MapPresenter: MapPresenterProtocol {
    
    weak var view: MapViewProtocol!
    var network: NetworkServiceProtocol!
    var router: MapRouterProtocol!
    
    var pickedLatitude: Double = 0
    var pickedLongtitude: Double = 0
    
    
}

