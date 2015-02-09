//
//  MouseTrapTests.swift
//  MouseTrapTests
//
//  Created by Nolan Carroll on 2/8/15.
//  Copyright (c) 2015 Nolan Carroll. All rights reserved.
//

import Foundation
import Cocoa
import XCTest
import Quick
import Nimble

class MouseTrapTests: XCTestCase {
    
    //var mouseTrap = MouseTrap()
    var mouseTrap = MouseTrap()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        XCTAssert(true, "Pass")
    }
    
    func testBindsToCommands() {
        var triggered = false
        
        mouseTrap.bind("f", handler: { () -> Void in
            triggered = true
        })
        
        var ev = NSEvent.keyEventWithType(NSEventType.KeyDown, location: CGPointZero, modifierFlags: NSEventModifierFlags.allZeros, timestamp: 1.0, windowNumber: 0, context: nil, characters: "f", charactersIgnoringModifiers: "", isARepeat: false, keyCode: 3)
        
        mouseTrap.keyDown(ev)
        
        expect{triggered}.toEventually(beTruthy())
    }
    
    func testModifierKeys() {
        var triggered = false
        
        mouseTrap.bind("command f", handler: { () -> Void in
            triggered = true
        })
        
        var ev = NSEvent.keyEventWithType(NSEventType.KeyDown, location: CGPointZero, modifierFlags: NSEventModifierFlags.CommandKeyMask, timestamp: 1.0, windowNumber: 0, context: nil, characters: "f", charactersIgnoringModifiers: "", isARepeat: false, keyCode: 3)
        
        mouseTrap.keyDown(ev)
        
        expect{triggered}.toEventually(beTruthy())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
