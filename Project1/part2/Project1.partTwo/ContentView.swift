//
//  ContentView.swift
//  Project1.partTwo
//
//  Created by Caique Meira Oliveira on 4/22/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount: Double? = nil
    @State private var numberOfPeople = 0 //= two by default.
    @State private var tipPercentage = 10
    // Property wrapper to handle the set and get the focus state of in input.
    @FocusState private var isCheckAmountFocused: Bool
    
    private var currencyFormatter: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    var totalAmountWithTip: Double {
        let safeCheckAmount = checkAmount ?? 0
        let tipValue = 1 + (Double(tipPercentage) / 100)
        
        return safeCheckAmount * tipValue
    }
    
    var totalPerPerson: Double {
        let sanitizedNumberOfPeople = Double(numberOfPeople + 2)
        return totalAmountWithTip / sanitizedNumberOfPeople
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyFormatter))
                        .keyboardType(.decimalPad)
                        .focused($isCheckAmountFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(Array(stride(from: 0, to: 101, by: 5)), id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section  {
                    Text(totalAmountWithTip, format: .currency(code: currencyFormatter))
                } header: {
                    Text("Total amount for the check")
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: currencyFormatter))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isCheckAmountFocused = false
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
