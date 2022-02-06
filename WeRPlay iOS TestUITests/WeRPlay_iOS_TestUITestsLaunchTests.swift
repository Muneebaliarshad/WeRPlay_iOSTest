//
//  WeRPlay_iOS_TestUITestsLaunchTests.swift
//  WeRPlay iOS TestUITests
//
//  Created by Muneeb on 05/02/2022.
//

import XCTest

class WeRPlay_iOS_TestUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
