//
//  MainViewController+Current.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewController {
    
    func updateUI() {
        
        if let data = DataManager.prepareData(data: presenter.model, index: daysTableView.indexPathForSelectedRow?.row ?? 0) {
            
            updateWeatherWith(data: data)
        }
        
    }
    
    func updateWeatherWith(data: WeatherInfoData) {
        
        let tempString = "\(data[WeatherInfoParameters.min.rawValue] ?? "")° / \(data[WeatherInfoParameters.max.rawValue] ?? "")°"
        
        currentDateLabel.text = data[WeatherInfoParameters.day.rawValue]
        currentTemperatureLabel.text = tempString
        currentHumidityLabel.text = (data[WeatherInfoParameters.humidity.rawValue] ?? "") + " %"
        currentWindSpeedLabel.text = (data[WeatherInfoParameters.windSpeed.rawValue] ?? "") + " м/с"
        currentCityLabel.text = data[WeatherInfoParameters.city.rawValue]
        
        let iconDescription = data[WeatherInfoParameters.icon.rawValue] ?? ""
        let icon = WeatherImage(rawValue: iconDescription)?.imageWhite
        
        currentWeatherImageView.image = icon
    }
    
}
