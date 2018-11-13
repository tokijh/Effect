//
//  Animate.swift
//  Effect
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

extension EffectibleType {
    public func animate(_ animation: AnimationType) -> Effectible {
        return Animate(source: self.asEffectible(), animation: animation)
    }
}

class AnimateSink<E: EffectorType>: Sink<E>, EffectorType {
    
    private let _animation: AnimationType
    
    init(effector: E, animation: AnimationType) {
        _animation = animation
        super.init(effector: effector)
    }
    
    func on(_ view: UIView) {
        _animation.completedHandler = {
            self.forwardOn(view)
        }
        _animation.effect(view)
    }
}

class Animate: Effectible {
    
    private let _source: Effectible
    private let _animation: AnimationType
    
    init(source: Effectible, animation: AnimationType) {
        _source = source
        _animation = animation
    }
    
    override func effect<E: EffectorType>(_ effector: E) {
        let sink = AnimateSink(effector: effector, animation: _animation)
        _source.effect(sink)
    }
}
