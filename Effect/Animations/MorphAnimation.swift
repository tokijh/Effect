//
//  MorphAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class MorphAnimation: EffectAnimationType {
    
    public override func effect(_ view: UIView) {
        let morphX = CAKeyframeAnimation()
        morphX.keyPath = "transform.scale.x"
        morphX.values = [1, 1.3 * strength, 0.7, 1.3 * strength, 1]
        morphX.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphX.timingFunction = animationCurve.timingFunction
        morphX.duration = duration
        morphX.repeatCount = Float(repeatCount)
        
        let morphY = CAKeyframeAnimation()
        morphY.keyPath = "transform.scale.y"
        morphY.values = [1, 0.7, 1.3 * strength, 0.7, 1]
        morphY.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        morphY.timingFunction = animationCurve.timingFunction
        morphY.duration = duration
        morphY.repeatCount = Float(repeatCount)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [morphX, morphY]
        animationGroup.duration = duration
        animationGroup.delegate = self
        view.layer.add(animationGroup, forKey: "morph")
    }
}
