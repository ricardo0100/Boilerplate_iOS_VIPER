//
//  Constants.swift
//
//  Created by MARCELO GRACIETTI on 08/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Foundation
import Localize_Swift

enum Constants {
    
    enum URL {
        static let baseURL = "http://hspay.herokuapp.com/v1/"
        static let signUp = baseURL + ""
        static let login = baseURL + "auth/"
    }
    
    enum Storyboard {
        static let mainSearchStoryboard = "MainSearchStoryboard"
    }
    
    enum ViewControllerIdentifier {
        static let mainSearchViewControllerIdentifier = "MainSearchViewControllerID"
    }
    
    enum Label {
        static let padding = CGFloat(10)
        static let edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
    }
    
    enum Font {
        static let SFTextLight = "SanFranciscoText-Light"
        static let SFTextMedium = "SanFranciscoText-Medium"
        static let SFTextRegular = "SanFranciscoText-Regular"
    }

}
