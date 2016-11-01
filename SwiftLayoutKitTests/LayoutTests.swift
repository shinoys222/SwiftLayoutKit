//
//  LayoutTests.swift
//  SwiftLayoutKit
//
//  Created by Yanko Dimitrov on 3/26/15.
//  Copyright (c) 2015 Yanko Dimitrov. All rights reserved.
//

import UIKit
import XCTest

class LayoutTests: XCTestCase {
    
    let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let firstView = UIView()
    let secondView = UIView()
    
    override func setUp() {
        super.setUp()
        
        containerView.removeConstraints(containerView.constraints)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(firstView)
        containerView.addSubview(secondView)
    }
    
    func testThatWeCanAlignViewsToView() {
        
        let centerPoint = CGPoint(x: 100, y: 100)
        
        let centerX = constraintsWith(align: .centerX, toView: containerView, forViews: firstView, secondView)
        let centerY = constraintsWith(align: .centerY, toView: containerView, forViews: firstView, secondView)
        
        containerView.addConstraints(centerX)
        containerView.addConstraints(centerY)
        containerView.layoutIfNeeded()
        
        XCTAssertGreaterThan(containerView.constraints.count, 0, "We should be able to produce and add constraints")
        XCTAssert(firstView.frame.origin == centerPoint, "Should be equal to the center point of the alignment view")
        XCTAssert(secondView.frame.origin == centerPoint, "Should be equal to the center point of the alignment view")
    }
}
