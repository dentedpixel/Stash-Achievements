//
//  AchievementsInteractor.swift
//  StashInvest
//
//  Created by Russell Savage on 4/24/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit
import ObjectMapper

class AchievementsInteractor: AchievementsInteractorProtocol {
    
    weak var presenter: AchievementsPresenterProtocol?
    
    func retrieveAchievements( completionHandler: @escaping ([AchieveModel]) -> Void ){
         loadAchievementsJSON(completionHandler: { (jsonResult) in
            if let achievements = jsonResult["achievements"] as? [Dictionary<String,Any>] {
                
                var achArr:[AchieveModel] = []
                
                for item in achievements {
                    
                    if let achModel = AchieveModel(map: item){
                        achArr.append( achModel )
                    }
                }
                
                completionHandler(achArr)
            }else{
                completionHandler([])
            }
        }, failureHandler: {
            completionHandler([])
        })
    }
    
    func loadAchievementsJSON( completionHandler: ((Dictionary<String, Any>) -> Void ), failureHandler:(() -> Void) ){
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, Any> {
                    completionHandler(jsonResult)
                }else{
                    failureHandler()
                }
                
            } catch {
                failureHandler()
            }
        }
    }
    
}
