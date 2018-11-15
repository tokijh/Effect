//
//  WobbleAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class WobbleAnimation: EffectAnimationType {
    
    public override func effect(_ view: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3 * strength, -0.3 * strength, 0.3 * strength, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = duration
        animation.isAdditive = true
        
        let x = CAKeyframeAnimation()
        x.keyPath = "position.x"
        x.values = [0, 30 * strength, -30 * strength, 30 * strength, 0]
        x.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        x.timingFunction = animationCurve.timingFunction
        x.duration = duration
        x.isAdditive = true
        x.repeatCount = Float(repeatCount)

        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [animation, x]
        animationGroup.duration = duration
        animationGroup.delegate = self
        view.layer.add(animationGroup, forKey: "wobble")
    }
}
