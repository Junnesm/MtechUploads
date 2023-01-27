//
//  ContentView.swift
//  UnitConversion
//
//  Created by Junne Murdock on 1/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var measurementIn = "cups"
    @State private var measurementOut = "liters"
    let volumeIn = ["milliliters", "liters", "cups", "pints", "gallons"]
    let volumeOut = ["milliliters", "liters", "cups", "pints", "gallons"]

    @State var measurementInput = ""

    @State var newMeasurementMachine: Double = 0


    var total: Double {
        var newMeasurement = newMeasurementMachine

        let measurement = Double(measurementInput)


        switch measurementIn {
        case "milliliters":
            switch measurementOut {
            case "liters":
                newMeasurement = (measurement ?? 0) / 1000
            case "cups":
                newMeasurement = (measurement ?? 0) / 236.588
            case "pints":
                newMeasurement = (measurement ?? 0) / 473.176
            case "gallons":
                newMeasurement = (measurement ?? 0) / 3785.41
            case "milliliters":
                newMeasurement = (measurement ?? 0)
            default:
                print("Invalid Unit")
            }
        case "liters":
            switch measurementOut {
            case "milliliters":
                newMeasurement = (measurement ?? 0) * 1000
            case "cups":
                newMeasurement = (measurement ?? 0) * 4.2267528377
            case "pints":
                newMeasurement = (measurement ?? 0) * 2.1133763885
            case "gallons":
                newMeasurement = (measurement ?? 0) / 3.78541
            case "liters":
                newMeasurement = (measurement ?? 0)
            default:
                print("Invalid Unit")
            }
        case "cups":
            switch measurementOut {
            case "milliliters":
                newMeasurement = (measurement ?? 0) * 236.588
            case "liters":
                newMeasurement = (measurement ?? 0) / 4.2267528377
            case "pints":
                newMeasurement = (measurement ?? 0) / 2
            case "gallons":
                newMeasurement = (measurement ?? 0) / 16
            case "cups":
                newMeasurement = (measurement ?? 0)
            default:
                print("Invalid Unit")
            }
        case "pints":
            switch measurementOut {
            case "milliliters":
                newMeasurement = (measurement ?? 0) * 473.176
            case "liters":
                newMeasurement = (measurement ?? 0) / 2.1133763885
            case "cups":
                newMeasurement = (measurement ?? 0) * 2
            case "gallons":
                newMeasurement = (measurement ?? 0) / 8
            case "pints":
                newMeasurement = (measurement ?? 0)
            default:
                print("Invalid Unit")
            }
        case "gallons":
            switch measurementOut {
            case "milliliters":
                newMeasurement = (measurement ?? 0) * 3785.41
            case "liters":
                newMeasurement = (measurement ?? 0) * 3.78541
            case "cups":
                newMeasurement = (measurement ?? 0) * 16
            case "pints":
                newMeasurement = (measurement ?? 0) * 8
            case "gallons":
                newMeasurement = (measurement ?? 0)
            default:
                print("Invalid Unit")
            }
        default:
            print("Invalid Unit")
        }
        return newMeasurement
    }

    var body: some View {

            Form {
                Section {
                    VStack {
                        Picker("Input Measurement", selection: $measurementIn) {

                            ForEach (volumeIn, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.menu)
//                        .navigationBarTitle("Liquid Measurements")

                        Text("Input: \(measurementInput)")

                    }
                    TextField("Input Number", text: $measurementInput)
                }
                Section {
                    VStack{
                        Picker ("Output Measurement", selection: $measurementOut) {
                            ForEach(volumeOut, id: \.self) {
                                Text($0)

                            }
                        }
                        .pickerStyle(.menu)

                        Text("Output: \(total)")
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


