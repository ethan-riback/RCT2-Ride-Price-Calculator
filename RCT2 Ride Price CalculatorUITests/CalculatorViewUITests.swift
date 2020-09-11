//
//  CalculatorViewUITests.swift
//  RCT2 Ride Price CalculatorUITests
//
//  Created by Ethan Riback on 9/11/20.
//  Copyright © 2020 Ethan Riback. All rights reserved.
//

import XCTest

class CalculatorViewUITests: XCTestCase {
    var app: XCUIApplication!
}

// MARK: - XCTestCase

extension CalculatorViewUITests {
    override func setUpWithError() throws {
        try super.setUpWithError()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        app = XCUIApplication()
    }
}

// MARK: - Tests

extension CalculatorViewUITests {
    func testExample() throws {
        app.launch()

        XCTAssertTrue(app.isDisplayingCalculator)
    }
}

// MARK: - Helpers

extension XCUIApplication {
    var isDisplayingCalculator: Bool {
        return otherElements["CalculatorView"].exists
    }
}
