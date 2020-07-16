//
//  PriceCalculator.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

protocol PriceCalculatorType {
    func prices(
        rideType: RideType,
        excitement: Double,
        intensity: Double,
        nausea: Double,
        hasSameTypeInPark: Bool,
        isChargingEntryForPark: Bool,
        rideAge: RideAge
    ) -> (openRCT2: Double, otherRCT: Double)
}

struct PriceCalculator: PriceCalculatorType {
    func prices(
        rideType: RideType,
        excitement: Double,
        intensity: Double,
        nausea: Double,
        hasSameTypeInPark: Bool,
        isChargingEntryForPark: Bool,
        rideAge: RideAge
    ) -> (openRCT2: Double, otherRCT: Double) {
        let rideMultiplier = rideType.multipliers()
        let adjustedExcitement = excitement * 100.0 * rideMultiplier.excitement
        let adjustedIntensity = intensity * 100.0 * rideMultiplier.intensity
        let adjustedNausea = nausea * 100.0 * rideMultiplier.nausea
        var rideStats = ((adjustedExcitement + adjustedIntensity + adjustedNausea) / 1024).rounded(.down)

        if hasSameTypeInPark {
            rideStats = (rideStats * 0.75).rounded(.down)
        }

        if isChargingEntryForPark {
            rideStats = (rideStats * 0.25).rounded(.down)
        }

        let ageValues = rideAge.ageValue()

        var openRCT2 = (rideStats * ageValues.multiplier).rounded(.down)
        var otherRCT: Double
        if let summator = ageValues.summator {
            otherRCT = rideStats + summator
        } else {
            otherRCT = openRCT2
        }

        openRCT2 = openRCT2 / 5
        otherRCT = otherRCT / 5

        return (openRCT2, otherRCT)
    }
}
