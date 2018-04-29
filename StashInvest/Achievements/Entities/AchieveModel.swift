//
//  AchieveModel.swift
//  StashInvest
//
//  Created by Russell Savage on 4/23/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import Foundation

struct AchieveModel {
    var id = 0
    var level = "0"
    var backgroundImgUrl = ""
    var progress = 0.0
    var total = 50.0
    var accessible = false
    
    init(id:Int, level: String, backgroundImgUrl:String, progress: Double, total: Double, accessible: Bool){

        self.level = level
        self.backgroundImgUrl = backgroundImgUrl
        self.progress = progress
        self.total = total
        self.accessible = accessible
        
        // data checks
        if self.progress<0.0 {
            self.progress = 0.0
        }else if progress>self.total {
            self.progress = self.total
        }
    }
    
    init?(map:Dictionary<String,Any>){
        if let id = map["id"] as? Int,
            let level = map["level"] as? String,
            let progress = map["progress"] as? Double,
            let total = map["total"] as? Double,
            let bgImageURL = map["bg_image_url"] as? String,
            let accessible = map["accessible"] as? Bool {
            
            
            self = AchieveModel(id: id, level: level, backgroundImgUrl:bgImageURL, progress: progress, total: total, accessible: accessible)
            
            
            
        }else{
            return nil
        }
    }
}
