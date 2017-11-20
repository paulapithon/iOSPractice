//
//  ViewController.swift
//  Simple Calculator
//
//  Created by Paula on 20/11/17.
//  Copyright © 2017 Paula Pithon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNumberTxt: UITextField!
    @IBOutlet weak var secondNumberTxt: UITextField!
    @IBOutlet weak var resultTxt: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultTxt.text = "= 0"
    }
    
    @IBAction func plusBtn(_ sender: Any) {
        if let checkedFirstNumber = Int(firstNumberTxt.text!) {
            if  let checkedSecondNumber = Int(secondNumberTxt.text!) {
                let result = checkedFirstNumber + checkedSecondNumber
                resultTxt.text = "= \(String(result))"
            }
        }
    }
    
    @IBAction func minusBtn(_ sender: Any) {
        if let checkedFirstNumber = Int(firstNumberTxt.text!) {
            if  let checkedSecondNumber = Int(secondNumberTxt.text!) {
                let result = checkedFirstNumber - checkedSecondNumber
                resultTxt.text = "= \(String(result))"
            }
        }
    }
    
    @IBAction func timesBtn(_ sender: Any) {
        if let checkedFirstNumber = Int(firstNumberTxt.text!) {
            if  let checkedSecondNumber = Int(secondNumberTxt.text!) {
                let result = checkedFirstNumber * checkedSecondNumber
                resultTxt.text = "= \(String(result))"
            }
        }
    }
    
    @IBAction func divideBtn(_ sender: Any) {
        if let checkedFirstNumber = Int(firstNumberTxt.text!) {
            if  let checkedSecondNumber = Int(secondNumberTxt.text!) {
                let result = checkedFirstNumber / checkedSecondNumber
                resultTxt.text = "= \(String(result))"
            }
        }
    }
    
    @IBAction func restBtn(_ sender: Any) {
        if let checkedFirstNumber = Int(firstNumberTxt.text!) {
            if  let checkedSecondNumber = Int(secondNumberTxt.text!) {
                let result = checkedFirstNumber % checkedSecondNumber
                resultTxt.text = "= \(String(result))"
            }
        }
    }
    
}

