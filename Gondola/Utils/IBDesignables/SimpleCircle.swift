//
//  CustomCircle.swift
//
//  Created by MARCELO GRACIETTI on 23/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

@IBDesignable
class SimpleCircle: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.size.width/2
    }
}

