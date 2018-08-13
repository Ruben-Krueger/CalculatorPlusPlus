//
//  CalculatorModel.swift
//  Calculator ++
//
//  Created by Ruben Krueger on 8/4/18.
//  Copyright © 2018 Ruben Krueger. All rights reserved.
//

func add(_ number1: Double, number2: Double) -> Double {
    return number1 + number2
}
func subtract(_ number1: Double, number2: Double) -> Double {
    return number1 - number2
}

func multiply(_ number1: Double, number2: Double) -> Double {
    return number1 * number2
}

func divide(_ number1: Double, number2: Double) -> Double {
    return number1 / number2
}
func negate(_ number: Double) ->Double {
    return number == 0 ? number : number * -1
}



import Foundation

class CalculatorModel {
    
    private var total = 0.0
    
    private var pending: pendingBinaryOperationInfo?
    
    var result: Double {
        get {
            return total
        }
    }
    
    private struct pendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
        
        
    }
    
    private enum Operations {
        case Const
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double, Double) -> Double)
        case Equals
        
    }
    
    
    private var operations: Dictionary<String, Operations> = [
        "√": Operations.UnaryOperation(sqrt),
        "AC": Operations.Const,
        "+": Operations.BinaryOperation(add),
        "-": Operations.BinaryOperation(subtract),
        "*": Operations.BinaryOperation(multiply),
        "/": Operations.BinaryOperation(divide),
        "±": Operations.UnaryOperation(negate),
        "=": Operations.Equals,
    ]
    
    private func executePendingBinaryOperation() {
        if pending != nil {
            total = pending!.binaryFunction(pending!.firstOperand, total)
        }

    }
    
    func setOperand(operand: Double) {
        total = operand
    }
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .Const:
                total = 0
                if pending != nil {
                    pending?.firstOperand = 0
                }
                break
            case .UnaryOperation(let function):
                total = function(total)
                break
            case .BinaryOperation(let function):
                executePendingBinaryOperation()
                pending = pendingBinaryOperationInfo(binaryFunction: function, firstOperand: total)
                break
            case.Equals:
             executePendingBinaryOperation()
                
            }
        }
    }
    

}
