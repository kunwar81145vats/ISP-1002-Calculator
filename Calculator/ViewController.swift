//
//  ViewController.swift
//  Calculator
//
//  Created by Kunwar Vats on 18/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calculationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numberButtonAction(_ sender: UIButton)
    {
        switch sender.tag {
        case 0:
            print("0 pressed")
        case 1:
            print("1 pressed")
        case 2:
            print("2 pressed")
        case 3:
            print("3 pressed")
        case 4:
            print("4 pressed")
        case 5:
            print("5 pressed")
        case 6:
            print("6 pressed")
        case 7:
            print("7 pressed")
        case 8:
            print("8 pressed")
        case 9:
            print("9 pressed")
            
        default:
            print("decimal pressed")
        }
    }
    
    @IBAction func basicCalculationButtonAction(_ sender: UIButton)
    {
        switch sender.tag {
        case 101:
            print("/ is pressed")
        case 102:
            print("X is pressed")
        case 103:
            print("- is pressed")
        case 104:
            print("+ is pressed")
        case 105:
            print("% is pressed")
        default:
            print("will never get executed")
        }
    }
    
    @IBAction func complexCalculationButtonAction(_ sender: UIButton)
    {
        
    }
    
    @IBAction func clearButtonAction(_ sender: UIButton)
    {
        resultLabel.text = ""
        calculationLabel.text = ""
    }
    
    @IBAction func resultButtonAction(_ sender: UIButton)
    {
        
    }
    
    @IBAction func plusMinusButtonAction(_ sender: UIButton)
    {
        
    }
}

