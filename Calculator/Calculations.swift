//
//  Calculations.swift
//  Calculator
//
//  Created by Андрей Журавлев on 03.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation
import Expression

class Calculations {
    
    //MARK: Properties
	var result: Float?
	var str: String {
		didSet {
			_calc()
		}
	}
    
    
    //MARK: Init
    init(_ str: String) {
        self.str = str
    }
    
    
    //MARK: Public Methods
    
    //MARK: Private Nethods
	private func _calc() {
		let exp = Expression(str)
		do {
			try result = Float(exp.evaluate())
		} catch {
			result = nil
		}
	}
}
