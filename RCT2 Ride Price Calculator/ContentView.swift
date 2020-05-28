//
//  ContentView.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // TODO: Implement these in a ViewModel class
    @State var rideType: RideType = .selectARide
    @State var excitement = ""
    @State var intensity = ""
    @State var nausea = ""
    @State var hasSameTypeInPark = false
    @State var isChargingEntryForPark = false

    private let priceCalculator = PriceCalculator()

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Ride Type:")
                    Picker(selection: $rideType, label: Text("")) {
                        ForEach(RideType.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                        .frame(height: 75)
                        .clipped()
                }
                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Excitement:")
                            .frame(height: 32)
                        Text("Intensity:")
                            .frame(height: 32)
                        Text("Nausea:")
                            .frame(height: 32)
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("0.00", text: $excitement)
                            .padding(.trailing, 10)
                            .padding([.leading, .vertical], 5)
                            .border(Color.gray)
                        TextField("0.00", text: $intensity)
                            .padding(.all, 5)
                            .border(Color.gray)
                        TextField("0.00", text: $nausea)
                            .padding(.all, 5)
                            .border(Color.gray)
                    }
                }
                HStack {
                    CheckView(isChecked: $hasSameTypeInPark, title: "Same type in park?")
                    Spacer()
                }
                    .frame(height: 32)
                HStack {
                    CheckView(isChecked: $isChargingEntryForPark, title: "Charge entry for park?")
                    Spacer()
                }
                    .frame(height: 32)
            }
                .padding()
                .border(Color.gray)
            VStack {
                Text(rideType.rawValue)
                    .font(.headline)
                HStack(spacing: 0) {
                    List {
                        Section(header: Text("Ride Age (Months)")) {
                            ForEach(RideAge.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                    }
                        .frame(width: 100)
                        .listStyle(GroupedListStyle())
                    Divider()
                    List {
                        Section(header: Text("Max OpenRCT2 Price")) {
                            ForEach(RideAge.allCases, id: \.self) {
                                Text("$\(self.price(for: $0).openRCT2)")
                            }
                        }
                    }
                        .listStyle(GroupedListStyle())
                    Divider()
                    List {
                        Section(header: Text("Max RCT1/RCT2/RCTC Price")) {
                            ForEach(RideAge.allCases, id: \.self) {
                                Text("$\(self.price(for: $0).otherRCT)")
                            }
                        }
                    }
                        .listStyle(GroupedListStyle())
                }
                    .border(Color.gray)
                    .clipped()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Helpers
private extension ContentView {
    func price(for age: RideAge) -> (openRCT2: String, otherRCT: String) {
        let numericValues = priceCalculator.prices(
            rideType: rideType,
            excitement: Double(excitement) ?? 0,
            intensity: Double(intensity) ?? 0,
            nausea: Double(nausea) ?? 0,
            hasSameTypeInPark: hasSameTypeInPark,
            isChargingEntryForPark: isChargingEntryForPark,
            rideAge: age
        )

        let openRCT2 = String(format: "%.2f", numericValues.openRCT2)
        let otherRCT = String(format: "%.2f", numericValues.otherRCT)

        return (openRCT2, otherRCT)
    }
}

// TODO: make its own file
private struct CheckView: View {
    @Binding var isChecked: Bool
    var title:String
    private var image: String { isChecked ? "checkmark.square.fill": "square" }
    private var imageColor: Color { isChecked ? .blue : .gray }

    func toggle() { isChecked.toggle() }

    var body: some View {
        Button(action: toggle) {
            HStack {
                Text(title).foregroundColor(.black)
                Image(systemName: image)
                    .foregroundColor(imageColor)
            }
        }
    }
}
