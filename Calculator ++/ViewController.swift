//
//  ViewController.swift
//  Calculator ++
//
//  Created by Ruben Krueger on 8/4/18.
//  Copyright © 2018 Ruben Krueger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // where the result is displayed
    @IBOutlet weak var displayField: UILabel!
    
    // model for calculator
    private let calculator = CalculatorModel()
    
    private var constants = ["𝛑": 3.14]
    
    private var userTyping = false
    

    private var displayValue: Double {
        get {
            return Double(displayField.text!)!
        }
        set {
            displayField.text = String(newValue)
        }
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        var digit = sender.currentTitle
        digit = digit == "𝛑" ? "3.14" : digit
        if userTyping {
            let displayText = displayField.text!
            displayField.text = displayText + digit!
//            if((displayField.text != "0" || digit != "0")){
//                displayField.text = displayText + digit!
//            }
        }
        else {
            displayField.text = digit
        }
        userTyping = true
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        if userTyping {
            calculator.setOperand(operand: displayValue)
            userTyping = false
        }
        if let symbol = sender.currentTitle {
            calculator.performOperation(symbol)
        }
        displayValue = calculator.result
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

