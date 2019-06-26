//
//  FirstTests.swift
//  FirstTests
//
//  Created by Álvaro Ávalos Hernández on 6/26/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import XCTest
@testable import First

class FirstTests: XCTestCase {

    //Sirve para crear un objeto para su uso en pruebas
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    //Y este lo destruye
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
    
    func testHaterStartsNicely() {
        let hater = Hater()
        
        XCTAssertFalse(hater.hating)
        //XCTAssertFalse(hater.hating, "New Haters should not be hating.")
    }
    
    func testHaterHatesAfterBadDay() {
        var hater = Hater()
        
        hater.hadABadDay()
        
        XCTAssertTrue(hater.hating)
    }
    
    func testHaterHappyAfterGoodDay() {
        //Given --> Organizar
        var hater = Hater()
        //When --> Actuar
        hater.hadAGoodDay()
        //Then --> Afirmar
        XCTAssertFalse(hater.hating)
    }

}
