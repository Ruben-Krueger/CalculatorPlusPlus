//
//  CalculatorModel.swift
//  Calculator ++
//
//  Created by Ruben Krueger on 8/4/18.
//  Copyright © 2018 Ruben Krueger. All rights reserved.
//

import Foundation

class CalculatorModel {
    
    //
    private var total = "0"
    
    private var runningTotal = "0"
    
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
    
    
    private func performOperation() {
        var result = 0.0
        if(operandPressed == "+") {
            result = Double(total)! + Double(runningTotal)!
            total = String(result)
        }
        else if(operandPressed == "-") {
            result = Double(total)! - Double(runningTotal)!
            total = String(result)
        }
        else if(operandPressed == "*") {
            result = Double(total)! * Double(runningTotal)!
            total = String(result)
        }
        else if(Double(runningTotal) != 0){
            result = Double(total)! / Double(runningTotal)!
            total = String(result)
        }
    }
    
    func update(_ button: String) -> String{
  
        
        let digit = convertButtonToDigit(button)
        if(button == "=") {
            let temp = Double(total)! + Double(runningTotal)!
            total = String(temp)
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            
            
            return total
        }
        else if(button == "+/-" && runningTotal != "0") {
            let temp = -Double(runningTotal)!
            runningTotal = String(temp)
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
        else if(button == "%" && runningTotal != "0"){
            let temp = Double(runningTotal)!/100
            runningTotal = String(temp)
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
        else if(digit != -1 && operandPressed == "") {
            if(runningTotal == "0") {
                runningTotal = button
            }
            else {
                runningTotal += button
            }
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
        // digit pressed AND previous operator pressed
        else if(digit != -1 && operandPressed != "") {
            runningTotal = button
            performOperation()
            
            // reset the operand
            operandPressed = ""
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
            // operator pressed
        else if(Operands.contains(button)) {
            operandPressed = button
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
            // if the decimal point was pressed AND the total does not already contain one
        else if(button == "." && !total.contains(".")) {
            runningTotal += button
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return runningTotal
        }
        else if(button == "AC") {
            total = "0"
            runningTotal = "0"
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return total
        }
        else {
            print("Button: " + button)
            print("Running total: " + runningTotal)
            print("Total: " + total)
            print("Operand pressed" + operandPressed)
            return "0"
        }

        
//        let digit = convertButtonToDigit(button)
//        if(button == "=") {
//            total += runningTotal
//            return total
//        }
//        if(button == "+/-" && total != "0") {
//            let temp = -Double(total)!
//            total = String(temp)
//            return total
//        }
//        else if(button == "%" && total != "0"){
//            let temp = Double(total)!/100
//            total = String(temp)
//            return total
//        }
//        else if(digit != -1 && operandPressed == "") {
//            if(total == "0") {
//                runningTotal = button
//            }
//            else {
//                runningTotal += button
//            }
//            return runningTotal
//        }
//        // digit pressed AND previous operator pressed
//        else if(digit != -1 && operandPressed != "") {
//            performOperation(button)
//
//            // reset the operand
//            operandPressed = ""
//            return total
//        }
//        // operator pressed
//        else if(Operands.contains(button)) {
//            operandPressed = button
//            return total
//        }
//        // if the decimal point was pressed AND the total does not already contain one
//        else if(button == "." && !total.contains(".")) {
//            runningTotal += button
//            return runningTotal
//        }
//        else if(button == "AC") {
//            total = "0"
//            return total
//        }
//        else {
//            return "0"
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

//            return total
//        }
        
        
        
   

    
    }
}
