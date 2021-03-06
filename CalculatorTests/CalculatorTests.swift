//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Андрей Журавлев on 01.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import XCTest
import Expression
@testable import Calculator

class CalculatorTests: XCTestCase {

	func calcTest() {
		let str = "-((14+8)*2)"
		let exp = Expression(str)
		var res: Double
		do {
			res = try exp.evaluate()
		} catch {
			return
		}
		XCTAssert(res == -44)
	}
	
	func plusMinusTest() {
		var str = "4-2"
		str = "-(" + str + ")"
		let exp = Expression(str)
		var res: Double
		do {
			res = try exp.evaluate()
		} catch {
			return
		}
		XCTAssert(res == -2)
	}

}
