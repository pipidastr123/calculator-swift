//
//  ViewController.swift
//  Calculator
//
//  Created by Андрей Журавлев on 01.02.2020.
//  Copyright © 2020 Андрей Журавлев. All rights reserved.
//

import UIKit

//TODO: replace expr label with text field

class ViewController: UIViewController {
    
    //MARK: Properties
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var calcModel = Calculations("")
	var expStr = ""
    
    
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
			expStr = String(sender.tag)
            return
        }
        expressionLabel.text! += String(sender.tag)
		expStr += String(sender.tag)
		calculateAnswer()
		
    }
    @IBAction func EqualButtonPressed(_ sender: UIButton) {
        expressionLabel.text = answerLabel.text
        answerLabel.text = "0"
    }
    @IBAction func PlusButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "+"
		answerLabel.text! = ""
    }
    @IBAction func MinusButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "-"
		expStr += "-"
		answerLabel.text! = ""
    }
    @IBAction func MultiplicateButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "×"
		expStr += "*"
		answerLabel.text! = ""
    }
    @IBAction func DivideButtonPressed(_ sender: UIButton) {
        expressionLabel.text! += "÷"
		expStr += "/"
		answerLabel.text! = ""
    }
    @IBAction func DeleteButtonPressed(_ sender: UIButton) {
		if !expStr.isEmpty && !expressionLabel.text!.isEmpty {
			expressionLabel.text!.removeLast()
			expStr.removeLast()
			calculateAnswer()
		}
    }
    @IBAction func PlusMinusButtonPressed(_ sender: UIButton) {
		expressionLabel.text! = "-(" + expressionLabel.text! + ")"
    }
    @IBAction func ResetButtonPressed(_ sender: UIButton) {
        expressionLabel.text! = "0"
        answerLabel.text! = "0"
    }
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        if expressionLabel.text?.last != "," {
            expressionLabel.text! += ","
			expStr += ","
        }
    }
	@IBAction func ExpLabelSwipeRightAction(_ sender: UISwipeGestureRecognizer) {
		expressionLabel.text?.removeLast()
		expStr.removeLast()
		
	}
	
    
    //MARK: Private Methods
    private func calculateAnswer() {
		calcModel.str = expStr
		if let res = calcModel.result {
			answerLabel.text = String(res)
		} else {
			answerLabel.text = "NA"
		}
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	


}

