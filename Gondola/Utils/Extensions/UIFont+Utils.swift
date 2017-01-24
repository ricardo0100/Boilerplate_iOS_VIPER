//
//  UIFont+Utils.swift
//
//  Created by MARCELO GRACIETTI on 08/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func SFTextRegular(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextRegular, size: size)
    }
    
    static func SFTextLight(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextLight, size: size)
    }
    
    static func SFTextMedium(withSize size: CGFloat) -> UIFont? {
        return UIFont(name: Constants.Font.SFTextMedium, size: size)
    }
    

}
