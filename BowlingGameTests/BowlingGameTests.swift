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
    private var game: Game!
    
    override func setUp() {
        super.setUp()
        game = Game()
    }
    
    override func tearDown() {
        game = nil
        super.tearDown()
    }
    
    func test_gutterGame() {
        rollMany(pins: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func test_allOnes() {
        rollMany(pins: 1, times: 20)
        
        XCTAssertEqual(game.score(), 20)
    }
    
    func test_oneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(pins: 0, times: 17)
        
        XCTAssertEqual(game.score(), 16)
    }
    
    func test_oneStrike() {
        rollStrike()
        game.roll(3)
        game.roll(4)
        rollMany(pins: 0, times: 16)
        
        XCTAssertEqual(game.score(), 24)
    }
    
    func test_perfectGame() {
        rollMany(pins: 10, times: 12)
        
        XCTAssertEqual(game.score(), 300)
    }
    
    // MARK:- Helpers
    private func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            game.roll(pins)
        }
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
    
    private func rollStrike() {
        game.roll(10)
    }
}
