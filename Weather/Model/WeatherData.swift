//
//  WeatherData.swift
//  Weather
//
//  Created by Mehdi Abdi on 3/22/20.
//  Copyright © 2020 Mehdi Abdi. All rights reserved.
//

import Foundation

struct WGeoPositionData {
    let key:           String
    let localizedName: String
    
}

struct WCurrentConditionData {
    let temperature: Double
    let weatherText: String
    
    var temperatureInString: String {
        return String(temperature)
    }
    
    var imageCondition: String {
        switch weatherText {
        case "Cloudy":
            return "cloudy"
        case "Partly sunny":
            return "partly sunny"
        case "Rain":
            return "rain"
        case "Snow":
            return "snow"
        case "Sunny":
            return "sunny"
        case "Thunderbolt":
            return "thunderbolt"
        case "Windy":
            return "windy"
        default:
            return "sunny"
            
        }
    }
}
