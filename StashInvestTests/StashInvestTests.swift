//
//  StashInvestTests.swift
//  StashInvestTests
//
//  Created by Russell Savage on 4/23/18.
//  Copyright © 2018 Russell Savage. All rights reserved.
//

import XCTest

@testable import StashInvest

class StashInvestTests: XCTestCase {
    
    var presenter:AchievementsPresenterProtocol!
    var interactor:AchievementsInteractorProtocol!
    
    override func setUp() {
        super.setUp()
        
        presenter = AchievementsPresenter()
        interactor = AchievementsInteractor()
        presenter.interactor = interactor
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        presenter.interactor = nil
        presenter = nil
        interactor = nil
    }
    
    func testRatioOutOfBounds(){
        let model = AchieveModel(id: 0, level: "5", backgroundImgUrl: "https://cdn.zeplin.io/image.png", progress: 75.0, total: 50.0, accessible: true)
        
        XCTAssertTrue(model.progress <= model.total)
    }

    func testCanRetrieveAchievements(){
        let expectation = XCTestExpectation(description: "Interactor will receieve achievements")

        interactor.retrieveAchievements { achievements in
            expectation.fulfill()
        }
    }

    func testJSONHasSuccessCode(){
        let expectationTwoHundred = XCTestExpectation(description: "JSON has success code")
        interactor.loadAchievementsJSON(completionHandler: { (jsonResult) in
            let statusCode = jsonResult["status"] as? Int
            if statusCode==200 {
                expectationTwoHundred.fulfill()
            }
        }, failureHandler: { })
    }
    
    func testJSONHasSuccessResult(){
        let expectationSuccess = XCTestExpectation(description: "JSON has success result")
        interactor.loadAchievementsJSON(completionHandler: { (jsonResult) in
            let statusResult = (jsonResult["success"] as? Bool)!
            if statusResult {
                expectationSuccess.fulfill()
            }
        }, failureHandler: { })
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
