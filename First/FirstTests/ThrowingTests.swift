//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Álvaro Ávalos Hernández on 6/29/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import XCTest
@testable import First

class ThrowingTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    //Arroja si existio un error
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
            // success!
        } catch {
            XCTFail()
        }
    }
    
    //Revisa si arroja el error identificando el tipo de error
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    //Revisa que no haya arrojado algún error
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    //Arroja si existe un error identificando de que tipo
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        try game.play()
    }
    
    //Revisa un juego que esta disponible
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }
    
}

