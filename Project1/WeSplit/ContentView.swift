//
//  ContentView.swift
//  Project1
//
//  Created by Caique Meira Oliveira on 4/18/23.
//

import SwiftUI

extension String {
    func toSafeInt() -> Int {
        Int(self) ?? 0
    }
}

extension Int {
    func toString() -> String {
        String(self)
    }
}

struct ContentView: View {
    //  Property Wrapper lets us add this attribute to store data (create a state) in one view.
    //  P.S. Apple recommends setting them as `private` for controlling access since they are only available inside the view.
    @State private var counter = "0"
    @State private var selectedWeather = "Rainy"
    let weatherOptions = ["Rainy", "Sunny", "Cloudy"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    // A binding ($) is needed here, given we want to read and write to the property.
                    TextField("Initial value:", text: $counter)
                    
                    Text("Counter value: \(counter)")
                    
                    Button("Increment") {
                        counter = (counter.toSafeInt() + 1).toString()
                    }
                    Button("Decrement") {
                        counter = (counter.toSafeInt() - 1).toString()
                    }
                    
                }
                
                Section(header: Text("Favorite weather")) {
                    Picker("Select your favorite weather", selection: $selectedWeather) {
                        // `\.self` sets the item currently being iterated as the self-unique identity for the rendered items.
                        ForEach(weatherOptions, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationTitle("Counter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
