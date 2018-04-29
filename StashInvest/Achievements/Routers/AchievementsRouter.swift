//
//  AchievementsRouter.swift
//  StashInvest
//
//  Created by Russell Savage on 4/25/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit

class AchievementsRouter: AchievementsRouterProtocol {

    func createAchieveModule( withView view:AchievementsView & AchievementsViewProtocol ){
        let interactor: AchievementsInteractorProtocol = AchievementsInteractor()
        let presenter: AchievementsPresenterProtocol = AchievementsPresenter()
        
        let router: AchievementsRouterProtocol = AchievementsRouter()
        
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
        interactor.presenter = presenter
    }
}
