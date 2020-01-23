//
//  MainViewPresenter+Days.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

extension MainViewPresenter {
    
    func prepareDaysWeather(data: WeatherInfoData) -> DaysDataType {
        
        let tempString = "\(data[WeatherInfoParameters.min.rawValue] ?? "")° / \(data[WeatherInfoParameters.max.rawValue] ?? "")°"
        
        var dayString = ""
        if let index = data[WeatherInfoParameters.day.rawValue]?.firstIndex(of: ",") {
            let firstPart = data[WeatherInfoParameters.day.rawValue]?.prefix(upTo: index)
            dayString = firstPart?.description ?? ""
        }
        
        let image = WeatherImage(rawValue: data[WeatherInfoParameters.icon.rawValue] ?? "")?.imageBlack ?? UIImage()
        
        
        let dataToReturn = DaysDataType(dayString, tempString, image)
        
        return dataToReturn
    }
    
}
