//
//  ViewController.swift
//  Calculator
//
//  Created by Kunwar Vats on 18/02/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - Variables
    /*
     -1: none
     0: addition
     1: subtraction
     2: multiplication
     3: division
     4: percentage
     5: square root
     6: cube root
     7: log()
     8: sin()
     */
    var calculation: Int = -1
    var prevNumber: String = ""
    var currentNumber: String = ""
    
    //MARK: - Lifecycle method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        uiSetup()
        resetCalculator()
    }
    
    //MARK: - UI setup method
    func uiSetup()
    {
        calculationLabel.numberOfLines = 1
        resultLabel.numberOfLines = 1
        calculationLabel.lineBreakMode = .byTruncatingHead
        resultLabel.lineBreakMode = .byTruncatingHead
    }
    
    //MARK: - IBActions
    
    /*
     Description: IBAction for number buttons
     Parameters: sender: UIButton
     */
    @IBAction func numberButtonAction(_ sender: UIButton)
    {
        if resultLabel.text == cErrorMessage
        {
            resultLabel.text = ""
        }
        
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
            else if ((calculationLabel.text?.last?.isSymbol) == nil)
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
            
            calculateResult(prevNumber, currentNumber)
            calculationLabel.text?.append(enteredDigit)
        }
    }
    
    /*
     Description: IBAction for +, -, /, * operations
     Parameters: sender: UIButton
     */
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
            willPrint("/ is pressed")
            calculation = 3
            calculationLabel.text?.append(" / ")
        case 102:
            willPrint("X is pressed")
            calculation = 2
            calculationLabel.text?.append(" x ")

        case 103:
            willPrint("- is pressed")
            calculation = 1
            calculationLabel.text?.append(" - ")

        case 104:
            willPrint("+ is pressed")
            calculation = 0
            calculationLabel.text?.append(" + ")

        case 105:
            willPrint("% is pressed")
            calculation = 4
            calculationLabel.text?.append(" % ")

            
        default:
            willPrint("will never get executed")
        }
    }
    
    /*
     Description: IBAction for Sin, square root, cube root, log operations
     Parameters: sender: UIButton
     */
    @IBAction func complexCalculationButtonAction(_ sender: UIButton)
    {
        switch sender.tag {
        case 201:
            willPrint("Sin is pressed")
            if calculationLabel.text == "0"
            {
                resultLabel.text = cErrorMessage
                return
            }
            
            calculation = 9
            if ((calculationLabel.text?.last?.isWhitespace) != nil)
            {
                prevNumber = resultLabel.text?.count ?? 0 == 0 ? calculationLabel.text ?? "" : resultLabel.text ?? ""
                calculationLabel.text = "Sin\(prevNumber)"
                calculateResult(prevNumber, currentNumber)
            }
            
        case 202:
            willPrint("square root is pressed")
            if calculationLabel.text == "0"
            {
                resultLabel.text = cErrorMessage
                return
            }
            
            calculation = 5
            if ((calculationLabel.text?.last?.isWhitespace) != nil)
            {
                prevNumber = resultLabel.text?.count ?? 0 == 0 ? calculationLabel.text ?? "" : resultLabel.text ?? ""
                calculationLabel.text = "√\(prevNumber)"
                calculateResult(prevNumber, currentNumber)
            }
            
        case 203:
            willPrint("cube root is pressed")
            if calculationLabel.text == "0"
            {
                resultLabel.text = cErrorMessage
                return
            }
            calculation = 6
            if ((calculationLabel.text?.last?.isWhitespace) != nil)
            {
                prevNumber = resultLabel.text?.count ?? 0 == 0 ? calculationLabel.text ?? "" : resultLabel.text ?? ""
                calculationLabel.text = "3√\(prevNumber)"
                calculateResult(prevNumber, currentNumber)
            }
            
        case 204:
            willPrint("log is pressed")
            if calculationLabel.text == "0"
            {
                resultLabel.text = cErrorMessage
                return
            }
            calculation = 7
            if ((calculationLabel.text?.last?.isWhitespace) != nil)
            {
                prevNumber = resultLabel.text?.count ?? 0 == 0 ? calculationLabel.text ?? "" : resultLabel.text ?? ""
                calculationLabel.text = "log\(prevNumber)"
                calculateResult(prevNumber, currentNumber)
            }
        default:
            willPrint("will never get executed")
        }
    }
    
    /*
     Description: IBAction AC button
     Parameters: sender: UIButton
     */
    @IBAction func clearButtonAction(_ sender: UIButton)
    {
        resetCalculator()
    }
    
    /*
     Description: IBAction for result(=) button
     Parameters: sender: UIButton
     */
    @IBAction func resultButtonAction(_ sender: UIButton)
    {
        calculationLabel.text = resultLabel.text
        resultLabel.text = ""
        calculation = -1
        currentNumber = ""
        prevNumber = calculationLabel.text ?? ""
    }
    
    /*
     Description: IBAction for +/- operation
     Parameters: sender: UIButton
     */
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
                if calculationLabel.text?.first == "-"
                {
                    calculationLabel.text?.removeFirst()
                }
                else
                {
                    calculationLabel.text = "-\(calculationLabel.text ?? "")"
                }
            }
        }
        else
        {
            if resultLabel.text?.first == "-"
            {
                resultLabel.text?.removeFirst()
                calculationLabel.text = "\(resultLabel.text ?? "")"
            }
            else
            {
                calculationLabel.text = "-\(resultLabel.text ?? "")"
            }
            
            resultLabel.text = ""
            calculation = -1
            currentNumber = ""
            prevNumber = calculationLabel.text ?? ""
        }
    }
    
    //MARK: - Calculator Methods
    
    /*
     Description: Performs the calculator operations and sets the result to the label
     Parameters: leftvalue: String, rightValue: String
     */
    func calculateResult(_ leftValue: String, _ rightValue: String)
    {
        let leftVal: Float = Float(leftValue) ?? 0.0
        let rightVal: Float = Float(rightValue) ?? 0.0
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
            result = leftVal.squareRoot()
        case 6:
            result = pow(leftVal, 1/3)
        case 7:
            willPrint("log calculate")
            result = log(leftVal)
        case 8:
            willPrint("Sin")
            result = sin(leftVal)
            
        default:
            willPrint("do nothing")
        }
                
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        
        resultLabel.text = "\(formatter.string(from: NSNumber(value: result)) ?? "")"
    }
    
    /*
     Description: Method to reset Calculator. Called on AC button action and on app launch.
     */
    func resetCalculator()
    {
        resultLabel.text = ""
        calculationLabel.text = "0"
        calculation = -1
        prevNumber = ""
        currentNumber = ""
    }
}

