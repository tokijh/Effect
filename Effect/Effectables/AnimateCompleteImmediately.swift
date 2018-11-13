//
//  AnimateCompleteImmediately.swift
//  Effect
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import Foundation

extension EffectibleType {
    public func animate(_ animation: AnimationType, completeImmediately: Bool) -> Effectible {
        if completeImmediately {
            return AnimateCompleteImmediately(source: self.asEffectible(), animation: animation)
        } else {
            return animate(animation)
        }
    }
}

final fileprivate class AnimateCompleteImmediatelySink<E: EffectorType>: Sink<E>, EffectorType {
    
    private let _animation: AnimationType
    
    init(effector: E, animation: AnimationType) {
        _animation = animation
        super.init(effector: effector)
    }
    
    func on(_ view: UIView) {
        _animation.effect(view)
        forwardOn(view)
    }
    
    func run(source: Effectible) {
        source.effect(self)
    }
}

final fileprivate class AnimateCompleteImmediately: Effectible {
    
    private let _source: Effectible
    private let _animation: AnimationType
    
    init(source: Effectible, animation: AnimationType) {
        _source = source
        _animation = animation
    }
    
    override func effect<E: EffectorType>(_ effector: E) {
        let sink = AnimateCompleteImmediatelySink(effector: effector, animation: _animation)
        sink.run(source: _source)
    }
}
