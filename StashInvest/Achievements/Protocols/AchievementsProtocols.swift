//
//  AchievementsProtocols.swift
//  StashInvest
//
//  Created by Russell Savage on 4/23/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit



protocol AchievementsViewProtocol : class {
    func showLoading()
    func hideLoading()
    func show( withIems items:[AchieveModel] )
}

protocol AchievementsInteractorProtocol : class {
    func retrieveAchievements( completionHandler: @escaping ([AchieveModel]) -> Void )
    func loadAchievementsJSON( completionHandler: ((Dictionary<String, Any>) -> Void ), failureHandler:(() -> Void) )
    
    var presenter: AchievementsPresenterProtocol? { get set }
}

protocol AchievementsPresenterProtocol : class {
    func viewDidLoad()
    
    var view: AchievementsViewProtocol? { get set }
    var interactor: AchievementsInteractorProtocol? { get set }
    var router: AchievementsRouterProtocol? { get set }
}

protocol AchievementsRouterProtocol : class {
    func createAchieveModule( withView view:AchievementsView & AchievementsViewProtocol )
}
