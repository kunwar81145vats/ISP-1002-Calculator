//
//  CustomButton.swift
//  Calculator
//
//  Created by Kunwar Vats on 18/02/22.
//

import UIKit

//Error message for invalid input
let cErrorMessage = "Enter a number first"


//Variable to decide whether to perform print() statements
let isProduction = false

//Function to print items only if isProduction is set to false
func willPrint(_ val: Any...)
{
    if !isProduction
    {
        print(val)
    }
}

//CustomButton class to add corder radius to all buttons
class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
       super.awakeFromNib()
       //clipsToBounds set true
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //Adds corner radius to button
        self.layer.cornerRadius = 15
    }

}

