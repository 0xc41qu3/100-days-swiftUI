//
//  ContentView.swift
//  Challenge
//
//  Created by Caique Meira Oliveira on 4/25/23.

/**
 Challenge
 
 Length conversion: users choose meters, kilometers, feet, yards, or miles.
 
 We must have:
 - A segmented control for meters, kilometers, feet, yard, or miles, for the input unit. ✔
 - A second segmented control for meters, kilometers, feet, yard, or miles, for the output unit. ✔
 - A text field where users enter a number. ✔
 - A text view showing the result of the conversion. ✔
 */

import SwiftUI

func getUnitLength(for unit: String) -> UnitLength {
    switch unit {
    case UnitLength.kilometers.symbol:
        return UnitLength.kilometers
    case UnitLength.feet.symbol:
        return UnitLength.feet
    case UnitLength.yards.symbol:
        return UnitLength.yards
    case UnitLength.miles.symbol:
        return UnitLength.miles
    default:
        return UnitLength.meters
    }
}

struct ContentView: View {
    @State private var unitFrom = UnitLength.meters.symbol
    @State private var unitTo = UnitLength.miles.symbol
    @State private var distanceToBeConverted: Double?
    @FocusState private var isDistanceFocused: Bool
    
    private let availableUnits = [
        UnitLength.meters.symbol,
        UnitLength.kilometers.symbol,
        UnitLength.feet.symbol,
        UnitLength.yards.symbol,
        UnitLength.miles.symbol
    ]
    
    private var conversionResult: Double {
        let distance = Measurement(
            value: distanceToBeConverted ?? 0,
            unit: getUnitLength(for: unitFrom)
        )
        
        return distance
            .converted(to: getUnitLength(for: unitTo))
            .value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Distance to be converted", value: $distanceToBeConverted, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isDistanceFocused)
                }
                Section("Unit to convert from") {
                    Picker("Select the input unit", selection: $unitFrom) {
                        ForEach(availableUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Unit to convert to") {
                    Picker("Select the output unit", selection: $unitTo) {
                        ForEach(availableUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Result") {
                    Text(conversionResult.formatted())
                }
            }
            .navigationTitle("iConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        isDistanceFocused = false
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
