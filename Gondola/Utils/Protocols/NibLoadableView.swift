//
//  NibLoadableView.swift
//
//  Created by MARCELO GRACIETTI on 08/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
}
