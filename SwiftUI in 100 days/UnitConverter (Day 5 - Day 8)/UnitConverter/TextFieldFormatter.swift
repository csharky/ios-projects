//
//  TextFieldFormatter.swift
//  UnitConverter
//
//  Created by Maxim on 24.09.2022.
//

internal protocol TextFieldFormatter {
    associatedtype Value
    func displayString(for value: Value) -> String
    func editingString(for value: Value) -> String
    func value(from string: String) -> Value
}
