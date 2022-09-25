//
//  Converter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import Foundation

protocol Converter {
    func convert(inputUnit: String, outputUnit: String, inputValue: Double) -> Double
}
