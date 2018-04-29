//
//  AchievementsTableCell.swift
//  StashInvest
//
//  Created by Russell Savage on 4/23/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit
import AlamofireImage

class AchievementsTableCell: UITableViewCell {

    @IBOutlet weak var shadowImageView: UIImageView!
    @IBOutlet weak var postImageView: UIImageView!
    
    @IBOutlet weak var levelNumLabel: UITextField!
    
    @IBOutlet weak var inactiveView: UIView!
    
    @IBOutlet weak var progressView: AchievementsProgressView!
    
    @IBOutlet weak var currentPointsLabel: UITextField!
    @IBOutlet weak var neededPointsLabel: UITextField!
    
    
    func set(forAchieve achieve: AchieveModel, withIndex index:Int) {
        
        
        self.selectionStyle = .none
        self.accessibilityIdentifier = "AchievementsTableCell\(index)"
        
        postImageView.layer.cornerRadius = 8
        postImageView.layer.masksToBounds = true
        
        shadowImageView.layer.shadowOffset = CGSize(width: 0, height: 0)
        shadowImageView.layer.shadowColor = UIColor.black.cgColor
        shadowImageView.layer.shadowOpacity = 0.9
        shadowImageView.layer.shadowRadius = 10
        
        levelNumLabel.text = String(achieve.level)
        let url = URL(string: achieve.backgroundImgUrl)!
        let placeholderImage = postImageView.image
        postImageView.af_setImage(withURL: url, placeholderImage: placeholderImage)
        
        // Progress
        let ratio: Double = achieve.progress / achieve.total
        progressView.setProgress(withRatio: ratio)
        
        currentPointsLabel.text = "\(Int(achieve.progress))pts"
        neededPointsLabel.text = "\(Int(achieve.total))pts"
        
        
        inactiveView.isHidden = achieve.accessible
        self.isUserInteractionEnabled = achieve.accessible
    }
}
