//
//  DividerTests.swift
//  FirstTests
//
//  Created by Álvaro Ávalos Hernández on 6/27/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import XCTest
@testable import First

class DividerTests: XCTestCase {

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
    
    func testDivision() {
        // given
        let divider = Divider()
        let dividend = 10
        let divisor = 3
        
        // when
        let result = divider.divisionRemainder(of: dividend, dividedBy: divisor)
        
        // then
        /*
        XCTAssertEqual(result.quotient, 3)
        XCTAssertEqual(result.remainder, 1)
        */
        //Metodo de verificación
        verifyDivision(result, expectedQuotient: 3, expectedRemainder: 1)
    }

    //Uso de directivas
    func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
        XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
        XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
    }

}
