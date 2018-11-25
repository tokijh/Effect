//
//  SwingAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class SwingAnimation: EffectAnimationType {
    
    public override func effect(_ view: UIView) {
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.rotation"
        animation.values = [0, 0.3 * strength, -0.3 * strength, 0.3 * strength, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.duration = duration
        animation.repeatCount = Float(repeatCount)
        animation.isAdditive = true
        animation.delegate = self
        
        view.layer.add(animation, forKey: "swing")
    }
}
