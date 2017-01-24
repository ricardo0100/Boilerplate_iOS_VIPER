//
//  PinkUILabel.swift
//
//  Created by MARCELO GRACIETTI on 13/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

@IBDesignable
class ValidableUILabel: UILabel {
    
    var isItsTextFieldInvalid = true
    
    func resetLabelColor(toColor color: UIColor? = UIColor.bubbleGum) {
        isItsTextFieldInvalid ? (textColor = color) : ()
        isItsTextFieldInvalid = false
    }
    
    func highlightLabelColor() {
        textColor = UIColor.tomato
        isItsTextFieldInvalid = true
    }
}

