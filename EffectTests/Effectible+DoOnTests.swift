//
//  Effectible+DoOnTests.swift
//  EffectTests
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import XCTest
import Effect

class EffectibleDoOnTests: XCTestCase { }

extension EffectibleDoOnTests {
    func testOn() {
        let view = UIView()
        var effector: EffectorType!
        let effectible: Effectible = Effectible
            .create { (e) in
                effector = e
            }
        
        var views: [UIView] = []
        
        let do_effectible = effectible
            .do({ (view) in
                views.append(view)
            })
        
        do_effectible.effect()
        
        XCTAssertEqual(views, [])
        
        effector.on(view)
        
        XCTAssertEqual(views, [view])
        
        effector.on(view)
        
        XCTAssertEqual(views, [view, view])
    }
    
    func testOnEffect() {
        var effector: EffectorType!
        let effectible: Effectible = Effectible
            .create { (e) in
                effector = e
        }
        
        var onEffectCount: Int = 0
        
        let do_effectible = effectible
            .do(onEffect: {
                onEffectCount += 1
            })
        
        XCTAssertEqual(onEffectCount, 0)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectCount, 1)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectCount, 2)
        
        effector.on(UIView())
        
        XCTAssertEqual(onEffectCount, 2)
        
        effector.on(UIView())
        
        XCTAssertEqual(onEffectCount, 2)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectCount, 3)
    }
    
    func testOnEffected() {
        var effector: EffectorType!
        let effectible: Effectible = Effectible
            .create { (e) in
                effector = e
        }
        
        var onEffectedCount: Int = 0
        
        let do_effectible = effectible
            .do(onEffected: {
                onEffectedCount += 1
            })
        
        XCTAssertEqual(onEffectedCount, 0)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectedCount, 1)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectedCount, 2)
        
        effector.on(UIView())
        
        XCTAssertEqual(onEffectedCount, 2)
        
        effector.on(UIView())
        
        XCTAssertEqual(onEffectedCount, 2)
        
        do_effectible.effect()
        
        XCTAssertEqual(onEffectedCount, 3)
    }
}
