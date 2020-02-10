//
//  ViewController.swift
//  Calculator
//
//  Created by Андрей Журавлев on 01.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    varvar calcModel: Calculations?
    
    
    //MARK: Outlets
    @IBOutlet weak var expressionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    //MARK: Actions
    @IBAction func NumberButtonPressed(_ sender: UIButton) {
        if expressionLabel.text == "0" {
            if sender.tag == 0 {
                return
            }
            expressionLabel.text = String(sender.tag)
            return
        }
        expressionLabel.text! += String(sender.tag)
    }
    @IBAction func EqualButtonPressed(_ sender: UIButton) {
        expressionLabel.text = answerLabel.text
        answerLabel.text = "0"
    }
    @IBAction func PlusButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "+"
    }
    @IBAction func MinusButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "-"
    }
    @IBAction func MultiplicateButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "×"
    }
    @IBAction func DivideButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "÷"
    }
    @IBAction func PercentButtonPressed(_ sender: UIButton) {
    }
    @IBAction func PlusMinusButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func ResetButtonPressed(_ sender: UIButton) {
        expressionLabel.text! = "0"
        answerLabel.text! = "0"
    }
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        if expressionLabel.text?.last != "," {
            expressionLabel.text! += ","
        }
    }
    
    
    //MARK: Private Methods
    private func calculateAnswer() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calcModel = Calculations(expressionLabel.text ?? "")
    }


}

