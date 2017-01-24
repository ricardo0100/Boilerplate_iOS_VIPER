//
//  InitializerInnerModuleSettings.swift
//
//  Created by MARCELO GRACIETTI on 22/11/16.
//  Copyright © 2016 Cheesecake Labs. All rights reserved.
//

import UIKit

class MainSearchModuleConfigurator {
    
    static func initialize() -> UIViewController? {
        
        let view = getMainSearchViewController()
        let interactor = MainSearchInteractor()
        let presenter = MainSearchPresenter()
        let router = MainSearchRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.view = view
        
        return view
    }
    
    static func getMainSearchViewController() -> MainSearchViewController {
        let ID = Constants.ViewControllerIdentifier.mainSearchViewControllerIdentifier
        let name = Constants.Storyboard.mainSearchStoryboard
        return StoryboardHelper.loadViewControllerWithIdentifier(ID, fromStoryboard: name) as! MainSearchViewController
    }
}
