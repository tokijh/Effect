//
//  EffectAnimationType.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class EffectAnimationType: NSObject, AnimationType {
    
    public var completedHandler: CompletedHandler?
    
    public func effect(_ view: UIView) {
        fatalError("abstract method")
    }
    
    var duration: TimeInterval
    var strength: CGFloat
    var repeatCount: Int
    var animationCurve: AnimationCurve
    
    public init(duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear) {
        self.duration = duration
        self.strength = strength
        self.repeatCount = repeatCount
        self.animationCurve = animationCurve
        super.init()
    }
}

extension EffectAnimationType: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard flag else { return }
        completedHandler?()
    }
}
