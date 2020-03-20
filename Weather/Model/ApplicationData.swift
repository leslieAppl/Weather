//
//  ApplicationData.swift
//  Weather
//
//  Created by leslie on 3/20/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import Foundation

struct WeatherData {
    var temperature: Double
    var precipitation: Double
    var humidity: Int
    var wind: Double
    var pressure: Double
    var visibility: Double
    var feels: Double
}

struct ApplicationData {
    var citiesName: [String] = []
    var citiesData: [WeatherData] = []
    var selectedCity: Int
    var celsius: Bool
    
    init() {
        var cities: [String: [Double]] = [:]
        cities["Toronto"] = [21, 0.0, 83, 0.0, 1.016, 14.5, 24]
        cities["New York"] = [18, 3.0, 95, 12.4, 1.020, 8.5, 15]
        cities["Paris"] = [24, 8.7, 90, 5.4, 1.055, 10.5, 25]
        
        for (city, data) in cities {
            citiesName.append(city)
            
            let newData = WeatherData(temperature: data[0], precipitation: data[1], humidity: Int(data[2]), wind: data[3], pressure: data[4], visibility: data[5], feels: data[6])
            citiesData.append(newData)
        }
        
        selectedCity = 0
        
        celsius = true
    }
}

var AppData = ApplicationData()
