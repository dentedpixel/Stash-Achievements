//
//  AchievementsPresenter.swift
//  StashInvest
//
//  Created by Russell Savage on 4/24/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit

class AchievementsPresenter: AchievementsPresenterProtocol {
    weak var view: AchievementsViewProtocol?
    var interactor: AchievementsInteractorProtocol?
    var router: AchievementsRouterProtocol?
    var presenter: AchievementsInteractorProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveAchievements{ achievements in
            self.view?.hideLoading()
            
            self.view?.show(withIems: achievements)
        }
    }


}

