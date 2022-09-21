//
//  ContentView.swift
//  WeSplit
//
//  Created by Maksim Statnykh on 21.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 1;
    @State private var name = "";
    @State private var students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "";
    
    var body: some View {
        NavigationView
        {
            Form {
                Button("Tap Count: \(tapCount)") {
                    tapCount += 1;
                }
                
                TextField("Enter your name", text: $name)
                
                Text("Your entered name is: \(name)")
                
                Group{
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                //it's lifehack - how to deal with limitation of 10 elements
                Group {
                    Text("Hello, World!")
                }
                
                Section {
                    Text("Hello, World!")
                }
                
                Section {
                    Text("Hello, World!")
                    Text("Hello, World!")
                }
                
                Picker("Select student:", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { student in
                        Text(student)
                    }
                }
                
                ForEach(0..<20) { number in
                    Text("Row \(number)")
                }
            }
            .navigationTitle("Some Title")
            .navigationBarTitleDisplayMode(NavigationBarItem.TitleDisplayMode.large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
