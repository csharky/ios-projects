//
//  VolumeFormatter.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import SwiftUI

struct VolumeFormatter: TextFieldUnitFormatter {
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
        case "Millilitres":
            output = "mL"
        case "Litres":
            output = "L"
        case "Cups":
            output = "cup"
        case "Pints":
            output = "pt"
        case "Gallons":
            output = "gal"
        default:
            output = ""
        }
            
        return output
    }
}
