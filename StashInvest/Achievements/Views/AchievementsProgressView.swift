//
//  AchievementsProgressView.swift
//  StashInvest
//
//  Created by Russell Savage on 4/27/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit

class AchievementsProgressView: UIView {
    
    @IBOutlet weak var progressFillIn: UIView!
    @IBOutlet weak var progressBackground: UIView!
    
    var progressRatio = 0.0

    func setProgress( withRatio ratio:Double ){
        
        progressFillIn.layer.cornerRadius = 4
        progressFillIn.layer.masksToBounds = true
        
        self.layer.cornerRadius = 4
        self.layer.masksToBounds = true
        
        progressRatio = ratio
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        progressFillIn.frame = CGRect(x:0.0, y: 0.0, width: self.frame.width * CGFloat(progressRatio), height: self.frame.height)
    }
}
