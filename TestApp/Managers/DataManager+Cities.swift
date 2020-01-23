//
//  DataManager+Cities.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

//City json parsing
extension DataManager {
    
    static func getCitiesArray() {
        if let url = Bundle.main.url(forResource: "ua", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([CityModel].self, from: data)
                self.citiesArray = jsonData
            } catch {
                // handle error
            }
        }
    }
}
