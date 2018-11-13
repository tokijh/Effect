//
//  Sink.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

class Sink<E: EffectorType> {
    fileprivate let _effector: E
    
    init(effector: E) {
        _effector = effector
    }
    
    func forwardOn(_ view: UIView) {
        _effector.on(view)
    }
}
