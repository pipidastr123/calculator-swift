//
//  Calculations.swift
//  Calculator
//
//  Created by Андрей Журавлев on 03.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import Foundation

class Calculations {
    
    //MARK: Properties
    var pos = -1
    var ch = 0
    var str: String
    
    
    //MARK: Init
    init(_ str: String) {
        self.str = str
    }
    
    
    //MARK: Public Methods
    
    //MARK: Private Nethods
    private func nextChar() {
        pos += 1
        ch = pos < self.str.count ? 3 : -1
    }
}
