//
//  CustomButton.swift
//  Calculator
//
//  Created by Kunwar Vats on 18/02/22.
//

import UIKit

class CustomButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 15
    }

}
