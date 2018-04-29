//
//  AchievementsTableView.swift
//  StashInvest
//
//  Created by Russell Savage on 4/23/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import UIKit

class AchievementsView: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingIndicatorView: UIActivityIndicatorView!
    
    var presenter: AchievementsPresenterProtocol?
    
    var achieveList: [AchieveModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let router = AchievementsRouter()
        router.createAchieveModule(withView: self)
        presenter?.viewDidLoad()
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    }
}

extension AchievementsView: AchievementsViewProtocol {
    func showLoading() {
        loadingIndicatorView.isHidden = false
    }
    
    func hideLoading() {
        loadingIndicatorView.isHidden = true
    }
    
    func show( withIems items:[AchieveModel] ){
        achieveList = items
        tableView.reloadData()
    }
}

extension AchievementsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementsTableCell", for: indexPath) as! AchievementsTableCell
        
        let ach = achieveList[indexPath.row]
        cell.set(forAchieve: ach, withIndex:indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achieveList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        presenter?.showPostDetail(forPost: postList[indexPath.row])
    }
    
}
