//
//  RideType.swift
//  RCT2 Ride Price Calculator
//
//  Created by Ethan Riback on 5/27/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

enum RideType: String, CaseIterable {
    case selectARide = "Select a Ride"
    case cinema = "3D Cinema"
    case airPoweredVerticalCoaster = "Air Powered Vertical Coaster"
    case boatRide = "Boat Ride"
    case bobsleighCoaster = "Bobsleigh Coaster"
    case carRide = "Car Ride"
    case chairlift = "Chairlift"
    case circusShow = "Circus Show"
    case compactInvertedCoaster = "Compact Inverted Coaster"
    case corkscrewRollerCoaster = "Corkscrew Roller Coaster"
    case crookedHouse = "Crooked House"
    case dinghySlide = "Dinghy Slide"
    case dodgems = "Dodgems"
    case enterprise = "Enterprise"
    case ferrisWheel = "Ferris Wheel"
    case floorlessCoaster = "Floorless Coaster"
    case flyingRollerCoaster = "Flying Roller Coaster"
    case flyingSaucers = "Flying Saucers"
    case flyingTurns = "Flying Turns"
    case ghostTrain = "Ghost Train"
    case gigaCoaster = "Giga Coaster"
    case goKarts = "Go Karts"
    case hauntedHouse = "Haunted House"
    case hauntedMansionRide = "Haunted Mansion Ride"
    case heartlineTwisterCoaster = "Heartline Twister Coaster"
    case hypercoaster = "Hypercoaster"
    case hyperTwisterRollerCoaster = "Hyper-Twister Roller Coaster"
    case invertedHairpinCoaster = "Inverted Hairpin Coaster"
    case invertedImpulseCoaster = "Inverted Impulse Coaster"
    case invertedRollerCoaster = "Inverted Roller Coaster"
    case invertedShuttleCoaster = "Inverted Shuttle Coaster"
    case invertedVerticalShuttle = "Inverted Vertical Shuttle"
    case juniorRollerCoaster = "Junior Roller Coaster"
    case launchedFreefall = "Launched Freefall"
    case layDownRollerCoaster = "Lay Down Roller Coaster"
    case lift = "Lift"
    case limLaunchedRollerCoaster = "LIM Launched Roller Coaster"
    case logFlume = "Log Flume"
    case loopingRollerCoaster = "Looping Roller Coaster"
    case magicCarpet = "Magic Carpet"
    case maze = "Maze"
    case merryGoRound = "Merry Go Round"
    case mineRide = "Mine Ride"
    case mineTrainCoaster = "Mine Train Coaster"
    case miniGolf = "Mini Golf"
    case miniHelicopters = "Mini Helicopters"
    case miniRollerCoaster = "Mini Roller Coaster"
    case miniSuspendedCoaster = "Mini Suspended Coaster"
    case miniSuspendedFlyingCoaster = "Mini Suspended Flying Coaster"
    case miniatureRailway = "Miniature Railway"
    case monorail = "Monorail"
    case monorailCycles = "Monorail Cycles"
    case monsterTrucks = "Monster Trucks"
    case motionSimulator = "Motion Simulator"
    case multiDimensionRollerCoaster = "Multi Dimension Roller Coaster"
    case observationTower = "Observation Tower"
    case pirateShip = "Pirate Ship"
    case reverseFreefallCoaster = "Reverse Freefall Coaster"
    case reverserRollerCoaster = "Reverser Roller Coaster"
    case riverRafts = "River Rafts"
    case riverRapids = "River Rapids"
    case rotoDrop = "Roto Drop"
    case sideFrictionRollerCoaster = "Side Friction Roller Coaster"
    case spaceRings = "Space Rings"
    case spiralRollerCoaster = "Spiral Roller Coaster"
    case spiralSlide = "Spiral Slide"
    case splashBoats = "Splash Boats"
    case standupRollerCoaster = "Stand-up Roller Coaster"
    case standupTwisterCoaster = "Stand-up Twister Coaster"
    case steeplechase = "Steeplechase"
    case submarineRide = "Submarine Ride"
    case suspendedMonorail = "Suspended Monorail"
    case suspendedSwingingCoaster = "Suspended Swinging Coaster"
    case swingingInverterShip = "Swinging Inverter Ship"
    case topSpin = "Top Spin"
    case twist = "Twist"
    case twisterRollerCoaster = "Twister Roller Coaster"
    case verticalDropRollerCoaster = "Vertical Drop Roller Coaster"
    case virginiaReel = "Virginia Reel"
    case waterCoaster = "Water Coaster"
    case wildMouse = "Wild Mouse"
    case woodenRollerCoaster = "Wooden Roller Coaster"
    case woodenWildMouse = "Wooden Wild Mouse"
    case woodenWildMineRide = "Wooden Wild Mine Ride"

    func multipliers() -> (excitement: Double, intensity: Double, nausea: Double) {
        switch self {
        case .selectARide:
            return (0, 0, 0)
        case .cinema:
            return (20, 10, 0)
        case .airPoweredVerticalCoaster:
            return (44, 66, 10)
        case .boatRide:
            return (70, 6, 0)
        case .bobsleighCoaster, .flyingTurns:
            return (50, 30, 10)
        case .carRide, .monsterTrucks:
            return (70, 10, 10)
        case .chairlift:
            return (70, 10, 0)
        case .circusShow:
            return (20, 10, 0)
        case .compactInvertedCoaster:
            return (50, 30, 10)
        case .corkscrewRollerCoaster, .hypercoaster:
            return (50, 30, 10)
        case .crookedHouse:
            return (15, 8, 0)
        case .dinghySlide:
            return (50, 30, 10)
        case .dodgems:
            return (40, 20, 0)
        case .enterprise:
            return (50, 10, 0)
        case .ferrisWheel:
            return (60, 20, 10)
        case .flyingRollerCoaster:
            return (50, 30, 10)
        case .flyingSaucers:
            return (50, 25, 0)
        case .ghostTrain, .hauntedMansionRide:
            return (70, 10, 10)
        case .gigaCoaster:
            return (51, 32, 10)
        case .goKarts:
            return (120, 20, 0)
        case .hauntedHouse:
            return (20, 10, 0)
        case .heartlineTwisterCoaster:
            return (50, 30, 10)
        case .invertedHairpinCoaster:
            return (50, 30, 30)
        case .invertedImpulseCoaster:
            return (50, 30, 10)
        case .invertedRollerCoaster, .invertedShuttleCoaster, .invertedVerticalShuttle:
            return (50, 30, 10)
        case .juniorRollerCoaster:
            return (50, 30, 10)
        case .launchedFreefall:
            return (50, 50, 10)
        case .layDownRollerCoaster:
            return (50, 30, 10)
        case .lift:
            return (80, 10, 0)
        case .limLaunchedRollerCoaster:
            return (50, 30, 10)
        case .logFlume:
            return (80, 34, 6)
        case .loopingRollerCoaster:
            return (50, 30, 10)
        case .magicCarpet:
            return (50, 30, 10)
        case .maze:
            return (50, 0, 0)
        case .merryGoRound:
            return (50, 10, 0)
        case .mineRide:
            return (60, 20, 10)
        case .mineTrainCoaster:
            return (50, 30, 10)
        case .miniGolf:
            return (50, 30, 10)
        case .miniHelicopters:
            return (70, 10, 10)
        case .miniRollerCoaster:
            return (50, 30, 10)
        case .miniSuspendedCoaster, .miniSuspendedFlyingCoaster:
            return (50, 30, 10)
        case .miniatureRailway:
            return (70, 6, -10)
        case .monorail:
            return (70, 6, -10)
        case .monorailCycles:
            return (50, 10, 10)
        case .motionSimulator:
            return (24, 20, 10)
        case .multiDimensionRollerCoaster:
            return (50, 30, 10)
        case .observationTower:
            return (80, 10, 0)
        case .pirateShip:
            return (50, 30, 10)
        case .reverseFreefallCoaster:
            return (44, 66, 10)
        case .reverserRollerCoaster:
            return (48, 28, 7)
        case .riverRafts:
            return (80, 34, 6)
        case .riverRapids:
            return (72, 26, 6)
        case .rotoDrop:
            return (50, 50, 10)
        case .sideFrictionRollerCoaster:
            return (48, 28, 7)
        case .spaceRings:
            return (12, 4, 4)
        case .spiralRollerCoaster:
            return (50, 30, 10)
        case .spiralSlide:
            return (50, 10, 0)
        case .splashBoats:
            return (80, 34, 6)
        case .standupRollerCoaster:
            return (50, 30, 10)
        case .steeplechase:
            return (50, 30, 10)
        case .submarineRide:
            return (70, 6, 0)
        case .suspendedMonorail:
            return (70, 6, -10)
        case .suspendedSwingingCoaster:
            return (50, 30, 10)
        case .swingingInverterShip:
            return (50, 30, 10)
        case .topSpin:
            return (24, 20, 10)
        case .twist:
            return (40, 20, 10)
        case .twisterRollerCoaster, .floorlessCoaster, .hyperTwisterRollerCoaster, .standupTwisterCoaster:
            return (52, 36, 10)
        case .verticalDropRollerCoaster:
            return (52, 38, 10)
        case .virginiaReel:
            return (30, 15, 25)
        case .waterCoaster:
            return (50, 30, 10)
        case .wildMouse:
            return (50, 30, 30)
        case .woodenRollerCoaster:
            return (52, 33, 8)
        case .woodenWildMouse, .woodenWildMineRide:
            return (50, 30, 30)
        }
    }
}
