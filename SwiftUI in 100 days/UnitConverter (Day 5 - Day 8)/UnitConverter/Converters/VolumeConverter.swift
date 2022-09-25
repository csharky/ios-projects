//
//  VolumeConverter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import Foundation

class VolumeConverter: Converter {
    func convert(inputUnit: String, outputUnit: String, inputValue: Double) -> Double {
        var millilitres = 0.0
        var outputValue = 0.0
        
        switch inputUnit {
        case "Millilitres":
            millilitres = inputValue
        case "Litres":
            millilitres = inputValue * 1000
        case "Cups":
            millilitres = inputValue * 300
        case "Pints":
            millilitres = inputValue * 473.176473
        case "Gallons":
            millilitres = inputValue * 3785.411784
        default:
            millilitres = 0.0
        }
        
        switch outputUnit {
        case "Millilitres":
            outputValue = millilitres
        case "Litres":
            outputValue = millilitres / 1000
        case "Cups":
            outputValue = millilitres / 300
        case "Pints":
            outputValue = millilitres / 473.176473
        case "Gallons":
            outputValue = millilitres / 3785.411784
        default:
            outputValue = 0.0
        }
        
        return outputValue
    }
}
