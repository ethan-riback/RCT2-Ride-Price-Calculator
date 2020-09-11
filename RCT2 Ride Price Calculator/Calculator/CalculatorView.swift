//
//  CalculatorView.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import Combine
import SwiftUI

struct CalculatorView<ViewModel: CalculatorViewModelType>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            VStack {
                RideTypeSelectionView(rideType: $viewModel.rideType)
                RideValuesView(excitement: $viewModel.excitement, intensity: $viewModel.intensity, nausea: $viewModel.nausea)
                RideTypeCheckView(hasSameTypeInPark: $viewModel.hasSameTypeInPark)
                EntryChargeCheckView(isChargingEntryForPark: $viewModel.isChargingEntryForPark)
            }
                .padding()
                .border(Color.gray)
            Text(viewModel.rideType.rawValue)
                .font(.headline)
            CalculationTableView(viewModel: viewModel)
        }
            .accessibility(value: Text("CalculatorView"))
    }
}

// MARK: View Helpers

private struct RideTypeSelectionView: View {
    @Binding var rideType: RideType

    var body: some View {
        HStack {
            Text("Ride Type:")
            Picker(selection: $rideType, label: Text("")) {
                ForEach(RideType.allCases, id: \.self) {
                    Text($0.rawValue).tag($0)
                }
            }
                .frame(width: 290, height: 75)
                .clipped()
        }
    }
}

private struct RideValuesView: View {
    @Binding var excitement: String
    @Binding var intensity: String
    @Binding var nausea: String

    var body: some View {
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
    }
}

private struct RideTypeCheckView: View {
    @Binding var hasSameTypeInPark: Bool

    var body: some View {
        HStack {
            CheckView(isChecked: $hasSameTypeInPark, title: "Same type in park?")
            Spacer()
        }
            .frame(height: 32)
    }
}

private struct EntryChargeCheckView: View {
    @Binding var isChargingEntryForPark: Bool

    var body: some View {
        HStack {
            CheckView(isChecked: $isChargingEntryForPark, title: "Charge entry for park?")
            Spacer()
        }
            .frame(height: 32)
    }
}

private struct CalculationTableView<ViewModel: CalculatorViewModelType>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        List {
            Section(header: CalculationHeaderView()) {
                ForEach(RideAge.allCases, id: \.self) {
                    CalculationRowView(rideAge: $0, viewModel: self.viewModel)
                }
            }
        }
            .listStyle(GroupedListStyle())
            .border(Color.gray)
            .clipped()
    }
}

private struct CalculationHeaderView: View {
    var body: some View {
        HStack {
            Text("Ride Age (Months)")
                .frame(width: 75, height: nil, alignment: .leading)
            Divider()
            Text("Max OpenRCT2 Price")
                .frame(width: 150, height: nil, alignment: .leading)
            Divider()
            Text("Max RCT1/RCT2/RCTC Price")
        }
    }
}

private struct CalculationRowView<ViewModel: CalculatorViewModelType>: View {
    var rideAge: RideAge
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        HStack {
            Text(rideAge.rawValue)
                .frame(width: 75, height: nil, alignment: .leading)
            Divider()
            Text("$\(viewModel.price(for: rideAge).openRCT2)")
                .frame(width: 150, height: nil, alignment: .leading)
            Divider()
            Text("$\(viewModel.price(for: rideAge).otherRCT)")
        }
    }
}

// MARK: Preview

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView(viewModel: CalculatorViewModel())
    }
}
