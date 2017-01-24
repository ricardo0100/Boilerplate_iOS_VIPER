//
//  StoryboardHelper.swift
//
//  Created by MARCELO GRACIETTI on 08/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class StoryboardHelper {
    
    static func loadViewControllerWithIdentifier(_ identifier: String, fromStoryboard storyboardName: String) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    
    static func getViewController<T>(fromViewControllers viewControllers: [UIViewController]?, type: T.Type) -> T? {
        guard let viewControllerArray = viewControllers else { return nil }
        for viewController in viewControllerArray {
            if viewController is T {
                return viewController as? T
            }
            if !viewController.childViewControllers.isEmpty {
                if let childViewController = getViewController(fromViewControllers: viewController.childViewControllers, type: type) {
                    return childViewController
                }
            }
        }
        return nil
    }
}
