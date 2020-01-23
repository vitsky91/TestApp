//
//  CityModel.swift
//  TestApp
//
//  Created by Vitalii Sydorskyi on 1/22/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation

struct CityModel: Codable {
    
    var city: String?
    var lat: String?
    var lng: String?
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case lat = "lat"
        case lng = "lng"
    }
}
