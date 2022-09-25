//
//  ConverterView.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import SwiftUI

struct ConverterView<Formatter: TextFieldUnitFormatter>: View {
    @State private var inputUnitValue = ""
    @State private var outputUnitValue = ""
    @State private var inputValue: Formatter.Value
    
    @State private var inputFormatter: Formatter
    @State private var outputFormatter: Formatter
    
    private let headerText: String
    private var units: [String]
    private var converter: Converter
    
    
    private var outputValue: Double? {
        if !inputUnitValue.isEmpty && !outputUnitValue.isEmpty {
            return converter.convert(inputUnit: inputUnitValue, outputUnit: outputUnitValue, inputValue: (inputValue as? Double) ?? 0.0)
        } else {
            return nil
        }
    }
    
    private var outputValueText: String {
        if outputValue != nil {
            return outputFormatter.displayString(for: outputValue! as! Formatter.Value)
        } else {
            return "Output value"
        }
    }
    
    init(headerText: String, units: [String], inputValue: Formatter.Value, converter: Converter, formatter: Formatter) {
        self.headerText = headerText
        self.units = units
        self.converter = converter
        self._inputFormatter = State<Formatter>(initialValue: formatter)
        self._outputFormatter = State<Formatter>(initialValue: formatter)
        self._inputValue = State<Formatter.Value>(initialValue: inputValue)
    }
    
    
    var body: some View {
        Section{
            Picker("Select input unit", selection: $inputUnitValue) {
                ForEach(units, id: \.self) { unit in
                    Text(unit)
                }
            }
            .onChange(of: inputUnitValue) { newInputUnit in
                inputFormatter.setUnit(newInputUnit)
            }
            Picker("Select output unit", selection: $outputUnitValue) {
                ForEach(units, id: \.self) { unit in
                    Text(unit)
                }
            }
            .onChange(of: outputUnitValue) { newInputUnit in
                outputFormatter.setUnit(newInputUnit)
            }
            FormattedTextField<Formatter>(
                "Enter value",
                value: $inputValue,
                formatter: inputFormatter
            )
            .keyboardType(.decimalPad)
        } header: {
            Text(headerText)
        }
        
        Section{
            Text(outputValueText)
        } header: {
            Text("Output")
        }
    }
}
