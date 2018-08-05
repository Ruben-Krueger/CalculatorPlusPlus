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
    @IBOutlet weak var resultField: UILabel!
    
    // model for calculator
    private let calculator = CalculatorModel()
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let button = sender.currentTitle
        resultField.text = calculator.update(button!)
        
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

