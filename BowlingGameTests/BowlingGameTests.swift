//
//  BowlingGameTests.swift
//  BowlingGameTests
//
//  Created by Samuel Stoltzfus on 9/2/20.
//  Copyright © 2020 Superior Plastic Products, Inc. All rights reserved.
//

import XCTest
@testable import BowlingGame

class BowlingGameTests: XCTestCase {
    func test_gutterGame() {
        let sut = Game()
        
        for _ in 1...20 {
            sut.roll(0)
        }
        
        XCTAssertEqual(sut.score(), 0)
    }
}
