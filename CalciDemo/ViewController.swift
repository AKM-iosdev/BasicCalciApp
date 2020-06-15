//
//  ViewController.swift
//  CalciDemo
//
//  Created by Arun Kumar Mora on 7/24/19.
//  Copyright © 2019 Arun Kumar Mora. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var operation = 0
    var isPerformingMath = false
    
    @IBOutlet weak var resultLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keypadBtn(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag

        if isPerformingMath == true {
            isPerformingMath = false
            resultLbl.text = String(tag - 1)
            numberOnScreen = Double(resultLbl.text!)!
        } else {
            resultLbl.text = resultLbl.text! + String(tag - 1)
            numberOnScreen = Double(resultLbl.text!)!
        }
    }
    
    @IBAction func operatorPressed(_ sender: Any) {
        
        let tag = (sender as! UIButton).tag
        if tag == 16 {
            resultLbl.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            return
        }
        
        if tag == 11 {
            isPerformingMath = true
            previousNumber = Double(resultLbl.text!)!
            resultLbl.text = "/"
            operation = tag
            
        } else if tag == 12 {
            isPerformingMath = true
            previousNumber = Double(resultLbl.text!)!
            resultLbl.text = "*"
            operation = tag
            
        } else if tag == 13 {
            isPerformingMath = true
            previousNumber = Double(resultLbl.text!)!
            resultLbl.text = "-"
            operation = tag
            
        } else if tag == 14 {
            isPerformingMath = true
            previousNumber = Double(resultLbl.text!)!
            resultLbl.text = "+"
            operation = tag
            
        } else if tag == 15 {
            if operation == 11 {
                resultLbl.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 {
                resultLbl.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 {
                resultLbl.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                resultLbl.text = String(previousNumber + numberOnScreen)
            }
        }
    }
}

