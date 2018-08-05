//
//  CalculatorModel.swift
//  Calculator ++
//
//  Created by Ruben Krueger on 8/4/18.
//  Copyright © 2018 Ruben Krueger. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    // most recently pressed operator
    private var operand: String?
    
    //
    private var total = "0"
    
    private var operandPressed = ""
    
    private let Operands: Set<String> = ["+","-", "*","/"]
    

    private func convertButtonToDigit(_ str: String) -> Int {
        switch str {
        case "0":
            return 0
        case "1":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        default:
            return -1
        }
        
    }
    
    
    private func performOperation(_ number: String) {
        var result = 0.0
        if(operandPressed == "+") {
            result = Double(total)! + Double(number)!
            total = String(result)
        }
        else if(operandPressed == "-") {
            result = Double(total)! - Double(number)!
            total = String(result)
        }
        else if(operandPressed == "*") {
            result = Double(total)! * Double(number)!
            total = String(result)
        }
        else if(Double(number) != 0){
            result = Double(total)! / Double(number)!
            total = String(result)
        }
    }
    
    func update(_ button: String) -> String{
        let digit = convertButtonToDigit(button)
        
//        // if digit pressed AND no previous operator pressed
//        if(digit != -1 && operandPressed == "") {
//            total += button
//            return total
//        }
//        else {
//            // digit pressed AND previous operator pressed
//            if(digit != -1 && operandPressed != "") {
//                performOperation(button)
//
//                // reset the operand
//                operandPressed = ""
//            }
//            // operand pressed
//            else if(Operands.contains(button)) {
//                operandPressed = button
//            }
//            // if the decimal point was pressed AND the total does not already contain one
//            else if(button == "." && !total.contains(".")) {
//                total += button
//            }
//            else if(button == "AC") {
//                total = "0"
//            }
//            else if(digit != -1 && total == "0") {
//                total = button
//            }
//            else if(digit != -1 && total != "0"){
//                total += button
//            }
//            return total
//        }
        
        
        
   

    
    }
}
