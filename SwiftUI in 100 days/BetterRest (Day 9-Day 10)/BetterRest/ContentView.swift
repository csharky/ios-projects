//
//  ContentView.swift
//  BetterRest
//
//  Created by Maxim on 25.09.2022.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUpDate = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("When do you want to wake up?")
                            .font(.headline)
                            
                        DatePicker("Please enter a time", selection: $wakeUpDate, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                    }
                    .frame(height: 100)
                }
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Desired amount of sleep")
                            .font(.headline)
                            
                        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    }
                    .frame(height: 100)
                }
                Section {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Daily coffee intake")
                            .font(.headline)
                            
                        Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value:$coffeeAmount, in: 0...20)
                    }
                    .frame(height: 100)
                }
                Section {
                    Button(action: calculateBedtime)
                        {
                            Text("Calculate")
                                .frame(maxWidth: .infinity, minHeight: 50)
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .buttonStyle(.borderless)
                        .cornerRadius(10)
                }.listRowBackground(Color.clear)
            }
            .navigationTitle("BetterRest")
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {
                    showingAlert = false
                }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpDate)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUpDate - prediction.actualSleep
            
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bedtime."
        }
        
        showingAlert = true
    }
}

struct ContentView_Preview : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
