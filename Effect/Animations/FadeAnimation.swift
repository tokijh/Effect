//
//  FadeAnimation.swift
//  Effect
//
//  Created by 윤중현 on 25/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class FadeAnimation: EffectAnimationType {
    
    var opacity: CGFloat
    
    public init(opacity: CGFloat,
                duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear) {
        self.opacity = opacity
        super.init(duration: duration, strength: strength, repeatCount: repeatCount, animationCurve: animationCurve)
    }
    
    public override func effect(_ view: UIView) {
        let fromValue = view.layer.presentation()?.opacity
        let toValue = opacity * strength
        let fade = CABasicAnimation()
        fade.keyPath = "opacity"
        fade.fromValue = fromValue
        fade.toValue = toValue
        fade.timingFunction = animationCurve.timingFunction
        fade.duration = CFTimeInterval(duration)
        fade.repeatCount = Float(repeatCount)
        fade.fillMode = CAMediaTimingFillMode.forwards
        fade.isRemovedOnCompletion = false
        fade.delegate = self
        
        view.layer.opacity = Float(toValue)
        view.layer.add(fade, forKey: "fade")
    }
}
