//
//  ContentView.swift
//  UnitConverter
//
//  Created by Maksim Statnykh on 22.09.2022.
//

import SwiftUI

struct ContentView: View {
    private let APP_NAME = "Unit Converter"
    
    enum Measures {
        case temperature, length, time, volume
    }
    
    @State private var currentMeasureIndex = -1
    
    private let measures = [Measures.temperature, Measures.length, Measures.time, Measures.volume]
    
    private let measuresTitles = [
        Measures.temperature: "Temperature",
        Measures.length: "Length",
        Measures.time: "Time",
        Measures.volume: "Volume"
    ]
    
    private let measuresConverterViews: [Measures: AnyView]
    
    private let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    private let lenghtUnits = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    private let timeUnits = ["Seconds", "Minutes", "Hours", "Days"]
    private let volumeUnits = ["Millilitres", "Litres", "Cups", "Pints", "Gallons"]
    
    init() {
        measuresConverterViews = [
            Measures.temperature: AnyView(ConverterView(headerText: "Temperature", units: temperatureUnits, inputValue: 0.0, converter: TemperatureConverter(), formatter: TemperatureFormatter())),
            Measures.length: AnyView(ConverterView(headerText: "Length", units: lenghtUnits, inputValue: 0.0, converter: LengthConverter(), formatter: LengthFormatter())),
            Measures.time: AnyView(ConverterView(headerText: "Time", units: timeUnits, inputValue: 0.0, converter: TimeConverter(), formatter: TimeFormatter())),
            Measures.volume: AnyView(ConverterView(headerText: "Volume", units: volumeUnits, inputValue: 0.0, converter: VolumeConverter(), formatter: VolumeFormatter())),
        ]
    }
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Choose measure type", selection: $currentMeasureIndex) {
                    ForEach(-1..<measures.count, id: \.self) {
                        if $0 == -1 {
                            Text("None")
                        } else {
                            Text(measuresTitles[measures[$0]] ?? "Unknown")
                        }
                    }
                }
                
                if (currentMeasureIndex > -1 && measuresConverterViews[measures[currentMeasureIndex]] != nil) {
                    measuresConverterViews[measures[currentMeasureIndex]]
                }
            }
            .navigationTitle(APP_NAME)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
