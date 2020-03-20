//
//  ViewController.swift
//  Weather
//
//  Created by leslie on 3/19/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class WeatherVC: UIViewController {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var precipitationLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var windLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var feelsLbl: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    func loadData() {
        let selected = AppData.selectedCity
        let cityData = AppData.citiesData[selected]
        
        var temperature = Measurement(value: cityData.temperature, unit: UnitTemperature.celsius)
        var feels = Measurement(value: cityData.feels, unit: UnitTemperature.celsius)
        if !AppData.celsius {
            temperature.convert(to: UnitTemperature.fahrenheit)
            feels.convert(to: UnitTemperature.fahrenheit)
        }
        
        let precipitation = Measurement(value: cityData.precipitation, unit: UnitLength.centimeters)
        let wind = Measurement(value: cityData.wind, unit: UnitSpeed.kilometersPerHour)
        let pressure = Measurement(value: cityData.pressure, unit: UnitPressure.millibars)
        let visibility = Measurement(value: cityData.visibility, unit: UnitLength.kilometers)
        
        let formatter = MeasurementFormatter()
        formatter.unitStyle = MeasurementFormatter.UnitStyle.short
        formatter.unitOptions = MeasurementFormatter.UnitOptions.providedUnit
        
        cityLbl.text = AppData.citiesName[selected]
        temperatureLbl.text = formatter.string(from: temperature)
        feelsLbl.text = formatter.string(from: feels)
        precipitationLbl.text = formatter.string(from: precipitation)
        humidityLbl.text = "\(cityData.humidity) %"
        windLbl.text = formatter.string(from: wind)
        pressureLbl.text = formatter.string(from: pressure)
        visibilityLbl.text = formatter.string(from: visibility)
    }
}

