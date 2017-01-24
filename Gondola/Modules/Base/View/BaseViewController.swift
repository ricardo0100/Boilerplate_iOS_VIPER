//
//  BaseView.swift
//
//  Created by MARCELO GRACIETTI on 08/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import MBProgressHUD
import Localize_Swift

class BaseViewController: UIViewController, BaseView {

    // MARK: Properties
    
    var progressHUD: MBProgressHUD?
    
    // MARK: Methods
    
    func showLoading() {
        let topmostViewController = findTopmostViewController()
        progressHUD = MBProgressHUD.showAdded(to: topmostViewController.view, animated: true)
        progressHUD?.mode = MBProgressHUDMode.indeterminate
    }
    
    func hideLoading() {
        self.progressHUD?.hide(animated: true)
    }
    
    func showMessage(_ message: String?, withTitle title: String?) {
        let errorMessage = message ?? "GENERIC_ERROR_MESSAGE".localized()
        let errorTitle = title ?? "ERROR".localized()
        let errorController = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        errorController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(errorController, animated: true, completion: nil)
    }
    func showError(_ message: String?) {
        let errorMessage = message ?? "GENERIC_ERROR_MESSAGE".localized()
        let errorController = UIAlertController(title: "TITLE_ERROR".localized(), message: errorMessage, preferredStyle: .alert)
        errorController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(errorController, animated: true, completion: nil)
    }
    
}
