//
//  PriceCalculator.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

// TODO: Move to own file
enum RideAge: String, CaseIterable {
    case lessThanFiveMonths = "<5"
    case lessThanThirteenMonths = "<13"
    case lessThanFortyMonths = "<40"
    case lessThanSixtyFourMonths = "<64"
    case lessThanEightyEightMonths = "<88"
    case lessThanOneHundredFourMonths = "<104"
    case lessThanOneHundredTwentyMonths = "<120"
    case lessThanOneHundredTwentyEightMonths = "<128"
    case lessThanTwoHundredMonths = "<200"
    case greaterThanFiveMonths = ">200"

    func ageValue() -> (multiplier: Double, summator: Double?) {
        switch self {
        case .lessThanFiveMonths:
            return (1.5, 30)
        case .lessThanThirteenMonths:
            return (1.2, 10)
        case .lessThanFortyMonths:
            return (1, nil)
        case .lessThanSixtyFourMonths:
            return (0.75, nil)
        case .lessThanEightyEightMonths, .greaterThanFiveMonths:
            return (0.56, nil)
        case .lessThanOneHundredFourMonths:
            return (0.42, nil)
        case .lessThanOneHundredTwentyMonths:
            return (0.32, nil)
        case .lessThanOneHundredTwentyEightMonths:
            return (0.16, nil)
        case .lessThanTwoHundredMonths:
            return (0.08, nil)
        }
    }
}

struct PriceCalculator {
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
