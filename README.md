# Weather

- Using Measurement(value: , unit: ) initializer
- Using MeasurementFormatter( )

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
            
            temperatureLbl.text = formatter.string(from: temperature)
            feelsLbl.text = formatter.string(from: feels)
            precipitationLbl.text = formatter.string(from: precipitation)
            humidityLbl.text = "\(cityData.humidity) %"
            windLbl.text = formatter.string(from: wind)
            pressureLbl.text = formatter.string(from: pressure)
            visibilityLbl.text = formatter.string(from: visibility)
        }



