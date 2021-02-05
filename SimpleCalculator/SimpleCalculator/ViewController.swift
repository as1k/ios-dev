//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by Асыланбек Нурмухамбет on 2/5/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var typing = false
    var isDotPlaced = false
    
    private var calculatorModel = CalculatorModel()
    
    var displayValue: Double {
        get{
            return Double(myDisplay.text!)!
        }
        set{
            myDisplay.text = String(newValue)
        }
    }

    @IBOutlet weak var myDisplay: UILabel!
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let current_digit = sender.currentTitle!
        if typing {
            let current_display = myDisplay.text!
            if current_display != String(0) {
                myDisplay.text = current_display + current_digit
            }
        } else {
            myDisplay.text = current_digit
            typing = true
        }
    }
    
    @IBAction func operationPressed(_ sender: UIButton) {
        calculatorModel.setOperand(displayValue)
        calculatorModel.performOperation(sender.currentTitle!)
        if calculatorModel.result != nil {
            displayValue = calculatorModel.result!
        }
        
        typing = false
        isDotPlaced = false
    }
    
    @IBAction func dotPressed(_ sender: UIButton) {
        if typing && !isDotPlaced {
            myDisplay.text = myDisplay.text! + "."
            isDotPlaced = true
        } else if !typing && !isDotPlaced {
            myDisplay.text = "0."
        }
    }
    
    @IBAction func clearPressed(_ sender: UIButton) {
        displayValue = 0
        typing = false
        isDotPlaced = false
    }
    
    
    @IBAction func setMinusSign(_ sender: UIButton) {
        displayValue *= -1
    }
    
    func hasIndex(stringToSearch str: String, characterToFind chr: Character) -> Bool {
        for c in str {
            if c == chr {
                return true
            }
        }
        return false
    }
}
