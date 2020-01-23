//
//  NetworkService.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/21/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getWeather(lon: String?, lat: String?, completion: @escaping (Result<ForecastWeatherModel?>) -> Void)
}


class NetworkService: NetworkServiceProtocol {
    
    func getWeather(lon: String?, lat: String?, completion: @escaping (Result<ForecastWeatherModel?>) -> Void) {
        
        if let doubleLon = lon, let doubleLat = lat {
            performFetch(lon: Double(doubleLon), lat: Double(doubleLat), completion: completion)
        } else {
            performFetch(completion: completion)
        }
        
    }
    
    private func performFetch(lon: Double? = nil, lat: Double? = nil, completion: @escaping (Result<ForecastWeatherModel?>) -> Void) {
        
        let requstURL = ((lon == nil) && (lat == nil)) ? requestUrl(systemMesurment: .Celsius) : requestUrl(systemMesurment: .Celsius, lon: lon, lat: lat)
        
        Alamofire.request(requstURL).responseData { (response) in
            
            if let data = response.data {
                
                let jsDecoder = JSONDecoder()
                let weatherData = try? jsDecoder.decode(ForecastWeatherModel.self, from: data)
                
                if let data = weatherData {

                    NotificationCenter.default.post(name: .DataReloaded, object: nil, userInfo: ["data": data])
                }
                
                
                completion(.success(weatherData))
                
            } else if let err = response.error {
                
                completion(.failure(err))
            }
        }
    }
    
}

extension NetworkService {

    /// Link prepare with parameters
    /// - Parameters:
    ///   - systemMesurment: Enum: Celsius, Fahrenheit, Kelvin
    ///   - fewDaysWeather: Bool: true - few days request, false - one day
    private func requestUrl(systemMesurment: SystemOfMeasurement, lon: Double? = nil, lat: Double? = nil) -> String {

        let language = "en"
        let url = "https://api.openweathermap.org/data/2.5"
        let apiKey = "213a683e43f9c04006135217e02dda1b"

        var cityNameUrl = "\(url)/forecast/?q=Zaporizhia&appid=\(apiKey)&units=\(systemMesurment.rawValue)&lang=\(language)"

        if let lattitude = lat?.description, let longtitude = lon?.description {
            cityNameUrl = "\(url)/forecast/?lat=\(lattitude)&lon=\(longtitude)&appid=\(apiKey)&units=\(systemMesurment.rawValue)&lang=\(language)"
        }

        return cityNameUrl

    }
}
