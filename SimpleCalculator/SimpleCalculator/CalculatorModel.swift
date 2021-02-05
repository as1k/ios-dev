//
//  CalculatorModel.swift
//  SimpleCalculator
//
//  Created by Асыланбек Нурмухамбет on 2/5/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation

enum Operation {
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double, Double)->Double)
    case equals
}

struct SaveFirstOperandAndOperation {
    var firstOperand: Double
    var operation: (Double, Double)->Double
     
    func performOperationWith(secondOperand op2: Double) -> Double {
        return operation (firstOperand, op2)
    }
}

struct CalculatorModel {
    
    private var global_value: Double?
    private var saving: SaveFirstOperandAndOperation?
    
    var myOperation: Dictionary<String, Operation> =
    [
        "PI": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "sqrt": Operation.unaryOperation(sqrt),
        "sqr": Operation.unaryOperation({$0*$0}),
        "+": Operation.binaryOperation({$0+$1}),
        "-": Operation.binaryOperation({$0-$1}),
        "*": Operation.binaryOperation({$0*$1}),
        "/": Operation.binaryOperation({$0/$1}),
        "=": Operation.equals,
        "%": Operation.unaryOperation({$0/100})
    ]
    
    mutating func setOperand(_ operand: Double) {
        global_value = operand
    }
    
    mutating func performOperation(_ operation: String) {
        let symbol = myOperation[operation]!
        switch symbol {
        case .constant(let value):
            global_value = value
        case .unaryOperation(let function):
            global_value = function(global_value!)
        case .binaryOperation(let function):
            saving = SaveFirstOperandAndOperation(
                firstOperand: global_value!,
                operation: function
            )
        case .equals:
            if global_value != nil {
                global_value = saving?.performOperationWith(secondOperand: global_value!)
            }
        }
    }
    
    mutating func clear() {
        saving?.firstOperand = 0
    }
    
    var result: Double? {
        get{
            return global_value
        }
    }
}
