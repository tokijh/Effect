//
//  EffectorTests.swift
//  EffectTests
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import XCTest
import Effect

class EffectorTests: XCTestCase { }

extension EffectorTests {
    func testContenienceOn() {
        let view: UIView = UIView()
        var effector: AnyEffector!
        let a: Effectible = Effectible.create { (e) in
            effector = e
        }
        
        var views: [UIView] = []
        
        a.effect { (view) in
            views.append(view)
        }
        
        XCTAssertEqual(views, [])
        
        effector.on(view)
        
        XCTAssertEqual(views, [view])
        
        effector.on(view)
        
        XCTAssertEqual(views, [view, view])
    }
}
