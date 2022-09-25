//
//  LengthFormatter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import SwiftUI

struct LengthFormatter: TextFieldUnitFormatter {
    typealias Value = Double?
    
    private var unit: String = ""
    
    mutating func setUnit(_ unit: String) {
        self.unit = unit
    }
    
    func displayString(for value: Double?) -> String {
        return formatString(for: value ?? 0.0)
    }
    
    func editingString(for value: Double?) -> String {
        return String(value ?? 0.0)
    }
    
    func value(from string: String) -> Double? {
        let stringWithoutUnit = string.replacingOccurrences(of: requiredPostfix(), with: "").trimmingCharacters(in: CharacterSet([" "]))
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
                
        return formatter.number(from: stringWithoutUnit)?.doubleValue
    }
    
    func formatString(for value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 5
        
        let valueString = formatter.string(from: value as NSNumber) ?? "0"
        
        return "\(valueString) \(requiredPostfix())"
    }
    
    private func requiredPostfix() -> String {
        var output = ""
            
        switch unit {
        case "Feet":
            output = "ft"
        case "Yards":
            output = "yd"
        case "Kilometers":
            output = "km"
        case "Miles":
            output = "mi"
        case "Meters":
            output = "m"
        default:
            output = ""
        }
            
        return output
    }
}
