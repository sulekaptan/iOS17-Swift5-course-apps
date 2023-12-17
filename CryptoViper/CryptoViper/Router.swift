//
//  Router.swift
//  CryptoViper
//
//  Created by Şule Kaptan on 16.12.2023.
//

import Foundation
import UIKit
//class, prootocol
//entrypoint

/*
uygulama ilk açıldığında hangi view gözükecek, nereye gidecek?
*/

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry : EntryPoint? {get}
    
    static func startExecution() -> AnyRouter
}

class CryptoRouter : AnyRouter {
    
    var entry: EntryPoint?
    
    
    static func startExecution() -> AnyRouter {
        let router = CryptoRouter()
        
        var view : AnyView = CryptoViewController()
        var presenter : AnyPresenter = CryptoPresenter()
        var interactor : AnyInteractor = CryptoInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.entry = view as? EntryPoint
        
        return router
    }
    
}
