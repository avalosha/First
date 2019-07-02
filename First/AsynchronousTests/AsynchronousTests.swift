//
//  AsynchronousTests.swift
//  AsynchronousTests
//
//  Created by Álvaro Ávalos Hernández on 6/29/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import XCTest
@testable import First

class AsynchronousTests: XCTestCase {
    
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
    
    //Detecta 0 numeros primos debido a que no espera el bloque
    func testPrimesUpTo100ShouldBe0() {
        // given
        let maximumCount = 100
        
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            // then
            XCTAssertEqual($0.count, 0)
        }
    }

    //Espera a que se calcules los numeros primos en el bloque (10segundos)
    func testPrimesUpTo100ShouldBe25() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        
        // when
        PrimeCalculator.calculate(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    /*
    //Primer Expectativa Avanzada
    //Invierte la expectativa para que cumplirla se considere algo malo
    func testFirstAdvancedExpectation() {
        // given
        let ai = AI()
        let expectation = XCTestExpectation(description: "Computer must wait at least two seconds before taking its turn")
        expectation.isInverted = true
        // when
        ai.startMove() {
            // then
            // pause competed; mark that we finished our turn
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 1.8)
    }
    */
    //Segunda Expectativa Avanzada
    //Espera tantas expectativas como se le indiquen y así pasar la prueba
    func testPrimesUpTo100ShouldBe25withExpectation() {
        // given
        let maximumCount = 100
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            expectation.fulfill()
        }
        
        //espera 3 segundos, por lo tanto si rebasa ese tiempo la prueba falla
        wait(for: [expectation], timeout: 3)
    }
    
    //Espera todas las expectativas verificando cada una de ellas
    func testPrimesUpTo100ShouldBe25VerifyingEachNumber() {
        // given
        let maximumCount = 100
        let primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]
        var primeCounter = 0
        
        let expectation = XCTestExpectation(description: "Calculate primes up to \(maximumCount)")
        expectation.expectedFulfillmentCount = 25
        
        // when
        PrimeCalculator.calculateStreaming(upTo: maximumCount) { number in
            XCTAssertEqual(primes[primeCounter], number)
            expectation.fulfill()
            primeCounter += 1
        }
        
        wait(for: [expectation], timeout: 3)
        print("Numeros primos: "+String(primeCounter))
    }
    
    //Espera las expectativas con uso de Progress
    func testPrimesUpTo100ShouldBe25WithProgress() {
        // given
        let maximumCount = 100
        
        // when
        let progress = PrimeCalculator.calculateShowingProgress(upTo: maximumCount) {
            XCTAssertEqual($0.count, 25)
        }
        
        // then
        let predicate = NSPredicate(
            format: "%@.completedUnitCount == %@", argumentArray: [progress, maximumCount]
        )
        
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: progress)
        wait(for: [expectation], timeout: 10)
    }
    
    //Revisa notificaciones
    //Usando uno por default, para evitar que tome una notificación accidentalmente
    func testUserUpgradedPostsNotification() {
        // given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        // when
        user.upgrade(using: center)
        
        // then
        wait(for: [expectation], timeout: 3)
    }
    
}
