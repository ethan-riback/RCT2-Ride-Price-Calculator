//
//  RideAge.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 7/16/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

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
