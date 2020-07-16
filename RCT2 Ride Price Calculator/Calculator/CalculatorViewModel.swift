//
//  CalculatorViewModel.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 7/16/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var rideType: RideType = .selectARide
    @Published var excitement: String = ""
    @Published var intensity = ""
    @Published var nausea = ""
    @Published var hasSameTypeInPark = false
    @Published var isChargingEntryForPark = false

    private let priceCalculator: PriceCalculatorType

    init(priceCalculator: PriceCalculatorType = PriceCalculator()) {
        self.priceCalculator = priceCalculator
    }

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

