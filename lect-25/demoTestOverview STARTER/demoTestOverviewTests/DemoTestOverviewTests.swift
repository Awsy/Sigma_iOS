//
//  DemoTestOverviewTests.swift
//  DemoTestOverviewTests
//
//  Created by Sigma Software University.
//  Copyright - present. All rights reserved.
//

import XCTest
@testable import demoTestOverview

class DemoTestOverviewTests: XCTestCase {
	
	var demoTestOverview: CalculatorViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
		super.setUp()
		
		demoTestOverview = CalculatorViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
	
	
	func addTesting() {
		let _: Float = 4
		let _: Float = 9
		
		let result = demoTestOverview.calculator.calculate(symbol: .plus)
		
		XCTAssertEqual(result, 13)
	}
	
	func minusTesting() {
		let _: Float = 4
		let _: Float = 10
		
		let result = demoTestOverview.calculator.calculate(symbol: .minus)
		
		XCTAssertEqual(result, 6)
	}
	
	func multiplyTesting() {
		let _: Float = 4
		let _: Float = 5
		
		let result = demoTestOverview.calculator.calculate(symbol: .multiply)
		
		XCTAssertEqual(result, 20)
	}
	
	func divideTesting() {
		let _: Float = 5
		let _: Float = 25
		
		let result = demoTestOverview.calculator.calculate(symbol: .divide)
		
		XCTAssertEqual(result, 5)
	}


    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
