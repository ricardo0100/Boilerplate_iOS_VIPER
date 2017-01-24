//
//  AppDelegate.swift
//  
//
//  Created by MARCELO GRACIETTI on 07/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupNavigationBarFont()
        setupBackButtonAppearance()
        Fabric.with([Crashlytics.self])
        presentInitialScreen()
        return true
    }
    
    // MARK: Private Methods
    
    func presentInitialScreen() {
        let rootRouter = RootRouter()
        rootRouter.presentFirstScreen(inWindow: window!)
    }
    
    fileprivate func setupNavigationBarFont() {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = .black
        navigationBarAppearace.barTintColor = .white
        navigationBarAppearace.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.black]
    }
    
    fileprivate func setupBackButtonAppearance() {
        UINavigationBar.appearance().backIndicatorImage = UIImage.backIcon
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage.backIcon
        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffset(horizontal: 0, vertical: -60), for: .default)
    }
}
