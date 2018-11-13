//
//  Effectible+DelayTests.swift
//  EffectTests
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import XCTest
import Effect

class EffectibleDelayTests: XCTestCase { }

extension EffectibleDelayTests {
    /*
     * Yes, I know. This is a wrong test case. But I don't have any idea...
     * Just, I wanted to make simply this library
     * Please make a PR :(
     */
    func testOnMain() {
        let view = UIView()
        var effector: EffectorType!
        let effectible: Effectible = Effectible
            .create { (e) in
                effector = e
            }
        
        let delay_effectible = effectible
            .delay(1)
        
        var effectedTime: TimeInterval = 0.0
        
        delay_effectible
            .effect { _ in
                effectedTime = Date().timeIntervalSinceNow
            }
        
        var now: TimeInterval = Date().timeIntervalSinceNow
        effector.on(view)
        XCTAssert(now.similar(effectedTime))
        
        effector.on(view)
        now = Date().timeIntervalSinceNow
        XCTAssert(now.similar(effectedTime))
        
        effector.on(view)
        now = Date().timeIntervalSinceNow
        XCTAssert(now.similar(effectedTime))
    }
}

fileprivate extension TimeInterval {
    func similar(_ time: TimeInterval) -> Bool {
        return (time - self) < 0.001
    }
}
