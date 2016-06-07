//
//  PracticalKitTests.swift
//  PracticalKitTests
//
//  Created by Peter Lafferty on 16/02/2016.
//  Copyright © 2016 Peter Lafferty. All rights reserved.
//

import XCTest
@testable import PracticalKit

class PracticalKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCitiesRepostitory() {
        let expectation = expectationWithDescription("PropertiesIncityRequest")
        
        CitiesRepository().properties() { result in
            let error:ErrorType?
            let properties:[Property]?
            
            switch result {
            case .Error(let e):
                error = e
                properties = nil
            case .Success(let p):
                error = nil
                properties = p
            }
            
            XCTAssertNil(error)
            XCTAssertNotNil(properties, "an array of properties should be returned")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10){ error in
            XCTAssertNil(error)
        }
    }
    
    func testPropertiesRepository(){
        let expectation = expectationWithDescription("SingleProperty")
        
        PropertiesRepository().property("17219") { result in
            let error:ErrorType?
            let property:Property?
            
            switch result {
            case .Error(let e):
                error = e
                property = nil
            case .Success(let p):
                error = nil
                property = p
            }
            
            XCTAssertNil(error)
            XCTAssertNotNil(property, "a single property should be returned")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(10){ error in
            XCTAssertNil(error)
        }
        
    }
    
}
