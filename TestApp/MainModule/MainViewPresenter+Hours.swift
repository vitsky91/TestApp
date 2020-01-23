//
//  MainViewPresenter+Hours.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Data processing
extension MainViewPresenter {
    
    func prepareHoursWeather(data: ForecastWeatherListModel) -> HoursDataType {
        
        func setupTime(textDate: String?) -> NSMutableAttributedString {
            
            let time = NSMutableAttributedString(string: textDate?.dropFirst(11).dropLast(6).description ?? "")
            let minutes = NSAttributedString(string: "00", attributes:
                [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10),
                 NSAttributedString.Key.baselineOffset: 5])
            time.append(minutes)
            
            return time
        }
        
        func setupTemperature(temp: Double?) -> String {
            
            let temp = Int(temp ?? 0)
            
            return temp.description + "°"
        }
        
        func setupImage(state: String?) -> UIImage {
            
            let onlyState = state?.dropLast().description //We dropping last char -> last char show day or night
            let state = WeatherImage.init(rawValue: onlyState ?? "")
            
            return state?.imageWhite ?? UIImage()
        }
        
        let dataToReturn = HoursDataType(setupTime(textDate: data.textDate), setupTemperature(temp: data.mainWeatherData.temp), setupImage(state: data.weatherState.first?.icon))
        
        return dataToReturn
    }
}
