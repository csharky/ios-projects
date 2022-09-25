//
//  LengthConverter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import Foundation

class LengthConverter: Converter {
    func convert(inputUnit: String, outputUnit: String, inputValue: Double) -> Double {
        var meters = 0.0
        var outputValue = 0.0
        
        switch inputUnit {
        case "Feet":
            meters = inputValue / 3.2808
        case "Yards":
            meters = inputValue / 1.094
        case "Kilometers":
            meters = inputValue * 1000
        case "Miles":
            meters = inputValue * 1609.34
        case "Meters":
            meters = inputValue
        default:
            meters = 0.0
        }
        
        switch outputUnit {
        case "Feet":
            outputValue = meters * 3.2808
        case "Yards":
            outputValue = meters * 1.094
        case "Kilometers":
            outputValue = meters / 1000
        case "Miles":
            outputValue = meters / 1609.34
        case "Meters":
            outputValue = inputValue
        default:
            outputValue = 0.0
        }
        
        return outputValue
    }
}
