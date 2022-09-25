//
//  FormatterFactory.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 24.09.2022.
//

import SwiftUI

class TemperatureFormatterFactory: Factory {
    func create() -> TemperatureFormatter {
        return TemperatureFormatter()
    }
    
    typealias Value = TemperatureFormatter
}

protocol Factory {
    associatedtype Value
    
    func create() -> Value
}
