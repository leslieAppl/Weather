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
    var citiesName: [String]
}
