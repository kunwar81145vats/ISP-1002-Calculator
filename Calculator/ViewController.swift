//
//  ViewController.swift
//  Calculator
//
//  Created by Kunwar Vats on 18/02/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    /*
     -1: none
     0: addition
     1: subtraction
     2: multiplication
     3: division
     4: percentage
     5: square root
     6: cube root
     7: log
     8: +/-
     9: power
     */
    var calculation: Int = -1
    var prevNumber: String = ""
    var currentNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiSetup()
        resetCalculator()
    }
    
    func uiSetup()
    {
        calculationLabel.numberOfLines = 1
        resultLabel.numberOfLines = 1
        calculationLabel.lineBreakMode = .byTruncatingHead
        resultLabel.lineBreakMode = .byTruncatingHead
    }
    
    @IBAction func numberButtonAction(_ sender: UIButton)
    {
        var enteredDigit: String = ""
        
        if sender.tag >= 0
        {
            enteredDigit = "\(sender.tag)"
        }
        else
        {
            if ((calculationLabel.text?.last?.isNumber) != nil)
            {
                enteredDigit = "."
            }
            else
            {
                enteredDigit = "0."
            }
        }
        
        if calculationLabel.text == "0"
        {
            calculationLabel.text = enteredDigit
        }
        else
        {
            if prevNumber.count != 0
            {
                if currentNumber.count == 0
                {
                    currentNumber = enteredDigit
                }
                else
                {
                    currentNumber += enteredDigit
                }
            }
            
            calculateResult()
            calculationLabel.text?.append(enteredDigit)
        }
    }
    
    @IBAction func basicCalculationButtonAction(_ sender: UIButton)
    {
        if calculationLabel.text?.count == 0
        {
            return
        }
        
        if !(calculationLabel.text?.last?.isNumber ?? false)
        {
            return
        }
        
        if prevNumber.count == 0 || resultLabel.text?.count == 0
        {
            prevNumber = calculationLabel.text ?? ""
        }
        else
        {
            prevNumber = resultLabel.text ?? ""
        }
        
        currentNumber = ""
        
        switch sender.tag {
        case 101:
            print("/ is pressed")
            calculation = 3
            calculationLabel.text?.append(" / ")
        case 102:
            print("X is pressed")
            calculation = 2
            calculationLabel.text?.append(" x ")

        case 103:
            print("- is pressed")
            calculation = 1
            calculationLabel.text?.append(" - ")

        case 104:
            print("+ is pressed")
            calculation = 0
            calculationLabel.text?.append(" + ")

        case 105:
            print("% is pressed")
            calculation = 4
            calculationLabel.text?.append(" % ")

            
        default:
            print("will never get executed")
        }
    }
    
    @IBAction func complexCalculationButtonAction(_ sender: UIButton)
    {
        switch sender.tag {
        case 201:
            print("^ is pressed")
        case 202:
            print("square root is pressed")
        case 203:
            print("cube root is pressed")
        case 204:
            print("log is pressed")
        default:
            print("will never get executed")
        }
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton)
    {
        resetCalculator()
    }
    
    @IBAction func resultButtonAction(_ sender: UIButton)
    {
        calculationLabel.text = resultLabel.text
        resultLabel.text = ""
        calculation = -1
        currentNumber = ""
        prevNumber = calculationLabel.text ?? ""
    }
    
    @IBAction func plusMinusButtonAction(_ sender: UIButton)
    {
        if resultLabel.text?.count == 0
        {
            if calculationLabel.text?.count == 0
            {
                return
            }
            else
            {
                calculationLabel.text = "-\(calculationLabel.text ?? "")"
            }
        }
    }
    
    func calculateResult()
    {
        let leftVal: Float = Float(prevNumber) ?? 0.0
        let rightVal: Float = Float(currentNumber) ?? 0.0
        var result: Float = 0.0
        
        switch calculation {
        case 0:
            result = leftVal + rightVal
        case 1:
            result = leftVal - rightVal
        case 2:
            result = leftVal * rightVal
        case 3:
            result = leftVal / rightVal
        case 4:
            result = leftVal.truncatingRemainder(dividingBy: rightVal)
        case 5:
            calculationLabel.text = "2√(\(calculationLabel.text ?? ""))"
            result = leftVal.squareRoot()
        case 6:
            calculationLabel.text = "3√(\(calculationLabel.text ?? ""))"
            result = pow(leftVal, 1/3)
        case 7:
            print("log calculate")
        case 8:
            print("+/-")
        case 9:
            print("power")
            
        default:
            print("do nothing")
        }
                
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        resultLabel.text = "\(formatter.string(from: NSNumber(value: result)) ?? "")"
    }
    
    func resetCalculator()
    {
        resultLabel.text = ""
        calculationLabel.text = "0"
        calculation = -1
        prevNumber = ""
        currentNumber = ""
    }
}

