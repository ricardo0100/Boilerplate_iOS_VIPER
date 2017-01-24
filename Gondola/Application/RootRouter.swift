//
//  RootWireframe.swift
//
//  Created by MARCELO GRACIETTI on 07/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class RootRouter: NSObject {
    
    func presentFirstScreen(inWindow window: UIWindow) {
        presentMainSearchScreen()
    }
    
    private func presentMainSearchScreen() {
        let mainSearchViewController = MainSearchModuleConfigurator.initialize()
        presentView(mainSearchViewController!)
    }
    
    private func presentView(_ viewController: UIViewController) {
        guard let window = UIApplication.shared.delegate?.window! else { return }
        window.backgroundColor = UIColor.white
        window.makeKeyAndVisible()
        window.rootViewController = viewController
        print("should be working")
    }    
}
