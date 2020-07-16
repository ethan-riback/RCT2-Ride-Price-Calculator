//
//  CalculatorView.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import Combine
import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: CalculatorViewModel

    init(viewModel: CalculatorViewModel = CalculatorViewModel()) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Ride Type:")
                    Picker(selection: $viewModel.rideType, label: Text("")) {
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
                        TextField("0.00", text: $viewModel.excitement)
                            .padding(.trailing, 10)
                            .padding([.leading, .vertical], 5)
                            .border(Color.gray)
                        TextField("0.00", text: $viewModel.intensity)
                            .padding(.all, 5)
                            .border(Color.gray)
                        TextField("0.00", text: $viewModel.nausea)
                            .padding(.all, 5)
                            .border(Color.gray)
                    }
                }
                HStack {
                    CheckView(isChecked: $viewModel.hasSameTypeInPark, title: "Same type in park?")
                    Spacer()
                }
                    .frame(height: 32)
                HStack {
                    CheckView(isChecked: $viewModel.isChargingEntryForPark, title: "Charge entry for park?")
                    Spacer()
                }
                    .frame(height: 32)
            }
                .padding()
                .border(Color.gray)
            VStack {
                Text(viewModel.rideType.rawValue)
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
                                Text("$\(self.viewModel.price(for: $0).openRCT2)")
                            }
                        }
                    }
                        .listStyle(GroupedListStyle())
                    Divider()
                    List {
                        Section(header: Text("Max RCT1/RCT2/RCTC Price")) {
                            ForEach(RideAge.allCases, id: \.self) {
                                Text("$\(self.viewModel.price(for: $0).otherRCT)")
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

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CalculatorViewModel())
    }
}
