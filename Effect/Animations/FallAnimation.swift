//
//  FallAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class FallAnimation: EffectAnimationType {
    
    public override func effect(_ view: UIView) {
        let rotate = CABasicAnimation()
        rotate.keyPath = "transform.rotation"
        rotate.toValue = 15 * (CGFloat.pi / 180)
        rotate.duration = duration
        rotate.isAdditive = true
        
        let fall = CABasicAnimation()
        fall.keyPath = "transform.translation.y"
        fall.toValue = 600 * strength
        fall.duration = duration
        fall.isAdditive = true
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotate, fall]
        animationGroup.duration = duration
        animationGroup.repeatCount = Float(repeatCount)
        animationGroup.fillMode = CAMediaTimingFillMode.forwards
        animationGroup.isRemovedOnCompletion = false
        animationGroup.delegate = self
        
        view.layer.add(animationGroup, forKey: "fall")
    }
}
