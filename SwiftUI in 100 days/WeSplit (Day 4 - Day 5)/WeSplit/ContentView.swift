//
//  ContentView.swift
//  WeSplit
//
//  Created by Maksim Statnykh on 21.09.2022.
//

import SwiftUI

struct ContentView: View {
    private let MIN_NUMBER_OF_PEOPLE = 2
    private let MAX_NUMBER_OF_PEOPLE = 100
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    @FocusState private var keyboardIsFocused: Bool
    
    let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    var currentCurrencyCode: String { Locale.current.currencyCode ?? "USD" }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + MIN_NUMBER_OF_PEOPLE)
        let tipMultiplier = Double(tipPercentage) / 100 + 1
        
        return (checkAmount * tipMultiplier) / peopleCount
    }
    
    var body: some View {
        NavigationView
        {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currentCurrencyCode))
                        .keyboardType(.decimalPad)
                        .focused($keyboardIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(MIN_NUMBER_OF_PEOPLE..<MAX_NUMBER_OF_PEOPLE) { people in
                            Text("\(people) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: currentCurrencyCode))
                } header: {
                    Text("Total amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        keyboardIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
