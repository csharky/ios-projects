//
//  TimeConverter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import Foundation

class TimeConverter: Converter {
    func convert(inputUnit: String, outputUnit: String, inputValue: Double) -> Double {
        var seconds = 0.0
        var outputValue = 0.0
        
        switch inputUnit {
        case "Seconds":
            seconds = inputValue
        case "Minutes":
            seconds = inputValue * 60
        case "Hours":
            seconds = inputValue * 60 * 60
        case "Days":
            seconds = inputValue * 60 * 60 * 24
        default:
            seconds = 0.0
        }
        
        switch outputUnit {
        case "Seconds":
            outputValue = seconds
        case "Minutes":
            outputValue = seconds / 60
        case "Hours":
            outputValue = seconds / 60 / 60
        case "Days":
            outputValue = seconds / 60 / 60 / 24
        default:
            outputValue = 0.0
        }
        
        return outputValue
    }
}
