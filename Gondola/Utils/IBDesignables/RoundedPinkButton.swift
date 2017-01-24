//
//  RoundedPinkButton.swift
//
//  Created by MARCELO GRACIETTI on 09/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedPinkButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 2.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    var isInvalidButton = false
    
    func resetBorderColor() {
        layer.borderColor = UIColor.pinkishGrey.cgColor
        layer.borderWidth = 0.5
        isInvalidButton = false
    }
    
    func highlightBorderColor() {
        layer.borderColor = UIColor.tomato.cgColor
        layer.borderWidth = 1.0
        isInvalidButton = true
    }
}
