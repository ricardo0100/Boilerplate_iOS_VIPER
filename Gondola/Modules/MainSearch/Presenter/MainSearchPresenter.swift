//
//  MainSearchPresenter.swift
//  Gondola
//
//  Created by MARCELO GRACIETTI on 23/01/17.
//  Copyright © 2017 Cheesecake Labs. All rights reserved.
//

import Foundation


class MainSearchPresenter: MainSearchPresentation, MainSearchInteractorOutput {
    
    // MARK: Properties
    
    weak var view: MainSearchView?
    var router: MainSearchWireframe?
    var interactor: MainSearchUseCase?
    
    // MARK: MainSearchPresentation protocol
    
    func doSomething() {
        view?.showMessage("I'm doing something!!", withTitle: "Hey")
    }
    
}
