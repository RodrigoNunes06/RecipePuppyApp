//
//  RecipePuppyAppUITests.swift
//  RecipePuppyAppUITests
//
//  Created by Rodrigo Nunes on 10/6/19.
//  Copyright © 2019 Rodrigo Nunes Gil. All rights reserved.
//

import XCTest

class RecipePuppyAppUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func testSearchBarAppears() {
        app.launch()
        XCTAssertTrue(app.searchFields.count > 0)
    }

    func testFavoriteButtonAppears() {
        app.launch()
        XCTAssertTrue(app.collectionViews.cells.buttons["Favorite"].exists)
    }
    
    func testFavoritesNavigationBarButtonAppears() {
        app.launch()
        XCTAssertTrue(app.navigationBars.buttons["Favorites"].exists)
    }
    
    func testTapOnFavoriteButtonShowsSavedAlert() {
        app.launch()
        app.collectionViews.cells.buttons["Favorite"].firstMatch.tap()
        XCTAssertTrue(app.alerts["Saved"].exists)
    }
    
    func testTapOnCellShowsModalWithWebView() {
        app.launch()
        app.collectionViews.cells.firstMatch.tap()
        XCTAssertTrue(app.webViews.firstMatch.exists)
    }
    
    func testTapOnFavoritesNavBarButtonShowsFavorites() {
        app.launch()
        app.navigationBars.buttons["Favorites"].firstMatch.tap()
        XCTAssertTrue(app.navigationBars.staticTexts["Favorite Recipes"].exists)
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
