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
	
	let mathLettersMap = ["×" : "*", "÷" : "/", "+" : "+", "-" : "-"]
    
    
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
		expStr = answerLabel.text ?? ""
        answerLabel.text = "0"
    }
	
	@IBAction func MathematicalButtonPressed(_ sender: UIButton) {
		addMathSymbol(letter: sender.title(for: .normal))
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
		expStr = "-(" + expStr + ")"
		calculateAnswer()
    }
    @IBAction func ResetButtonPressed(_ sender: UIButton) {
        expressionLabel.text! = "0"
		expStr = ""
        answerLabel.text! = "0"
    }
    @IBAction func commaButtonPressed(_ sender: UIButton) {
        if expressionLabel.text?.last != "," {
            expressionLabel.text! += ","
			expStr += "."
        }
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
	
	private func addMathSymbol(letter: String?) {
		guard let letter = letter else { return }
		expressionLabel.text! += letter
		expStr += mathLettersMap[letter] ?? ""
		answerLabel.text! = ""
	}
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
		expressionLabel.adjustsFontSizeToFitWidth = true
		expressionLabel.minimumScaleFactor = 0.3
    }
	


}

