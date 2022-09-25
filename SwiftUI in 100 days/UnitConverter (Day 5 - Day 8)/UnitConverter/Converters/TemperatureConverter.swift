//
//  TemperatureConverter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import Foundation

class TemperatureConverter: Converter {
    func convert(inputUnit: String, outputUnit: String, inputValue: Double) -> Double {
        var kelvins = 0.0
        var outputValue = 0.0
        
        switch inputUnit {
        case "Celsius":
            kelvins = inputValue + 273.15
        case "Fahrenheit":
            kelvins = (inputValue - 32.0) * 5/9 + 273.15
        case "Kelvin":
            kelvins = inputValue
        default:
            kelvins = 0.0
        }
        
        switch outputUnit {
        case "Celsius":
            outputValue = kelvins - 273.15
        case "Fahrenheit":
            outputValue = (kelvins - 273.15) * 9/5 + 32.0
        case "Kelvin":
            outputValue = kelvins
        default:
            outputValue = 0.0
        }
        
        return outputValue
    }
}
