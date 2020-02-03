//
//  NewButtons.swift
//  Calculator
//
//  Created by Андрей Журавлев on 01.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit


@IBDesignable class NewButton: UIButton {
    enum ButtonTypes {
        case mathAction, numbers, additionalActions
    }
    
    @IBInspectable var buttType
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    

}
