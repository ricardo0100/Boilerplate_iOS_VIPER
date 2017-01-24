//
//  UITextField+Border.swift
//
//  Created by MARCELO GRACIETTI on 13/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit


extension UITextField {
    
    func resetTextFieldBorder() {
        layer.borderColor = UIColor.pinkishGrey.cgColor
        layer.borderWidth = 0.5
    }
    
    func highlightTextFieldBorder() {
        layer.borderColor = UIColor.tomato.cgColor
        layer.borderWidth = 1.0
    }
    
    func disable() {
        self.alpha = 0.5
        self.backgroundColor = UIColor.silver
        self.isUserInteractionEnabled = false
    }
    
    func enable() {
        self.alpha = 1.0
        self.backgroundColor = UIColor.white
        self.isUserInteractionEnabled = true
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
