//
//  MainViewPresenter.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

typealias HoursDataType = (NSMutableAttributedString, String, UIImage)
typealias DaysDataType = (String, String, UIImage)
typealias WeatherInfoData = [String: String]

protocol MainViewControllerProtocol: class {
    
    //Out
    func reloadWeatherWithCoords(lat: String, lon: String)
    
    //In
    func reloadView()
    func reloadTable()
    func reloadCollection()
    func reloadCurrentWeather()
}

protocol MainViewPresenterProtocol: class {
    
    var view: MainViewControllerProtocol! { get set }
    var networkService: NetworkServiceProtocol! { get set }
    var router: MainViewRouterProtocol! { get set }
    
    var model: ForecastWeatherModel? { get set }
    var weatherInfoData: WeatherInfoData? {get set}
    
    var dayDescription: String { get set }
    
    func fetchData(lat: String?, lon: String?)
    
    func prepareHoursWeather(data: ForecastWeatherListModel) -> HoursDataType
    func prepareDaysWeather(data: WeatherInfoData) -> DaysDataType
    
    func showSearchCityView()
    func showMap()
}

class MainViewPresenter: MainViewPresenterProtocol {
    
    weak var view: MainViewControllerProtocol!
    var networkService: NetworkServiceProtocol!
    var router: MainViewRouterProtocol!
    
    var model: ForecastWeatherModel? {
        didSet {
            view.reloadView()
        }
    }
    
    var weatherInfoData: WeatherInfoData? {
        didSet {
            dayDescription = weatherInfoData?[WeatherInfoParameters.day.rawValue] ?? Double(Date().timeIntervalSince1970).dateStringFromUTC()
            view.reloadCollection()
            view.reloadCurrentWeather()
        }
    }
    
    var dayDescription = Double(Date().timeIntervalSince1970).dateStringFromUTC()
    
    func fetchData(lat: String?, lon: String?) {
        
        networkService?.getWeather(lon: lon, lat: lat, completion: {[weak self] (result) in
            
            switch result {
            case .success(let data):
                
                guard let data = data else { return }
                
                self?.model = data
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        })
    }
    
    func showSearchCityView() {
        
        router.showSearchCityView()
    }
    
    func showMap() {
        
        router.showMap()
    }
    
}


