//
//  UIAlertController.swift
//
//  Created by MARCELO GRACIETTI on 09/12/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    // MARK: - Utils
    
    static func presentActionSheetInViewController(_ viewController: UIViewController,
                                                   title: String?,
                                                   message: String?,
                                                   actions: [UIAlertAction],
                                                   completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .actionSheet)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.present(alertController, animated: true, completion: completion)
    }
    
    static func presentAlertInViewController(_ viewController: UIViewController,
                                             title: String?,
                                             message: String?,
                                             actions: [UIAlertAction],
                                             completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        for action in actions {
            alertController.addAction(action)
        }
        viewController.present(alertController, animated: true, completion: completion)
    }
}
