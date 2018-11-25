//
//  CornerAnimation.swift
//  Effect
//
//  Created by 윤중현 on 25/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class CornerAnimation: EffectAnimationType {
    
    var radius: CGFloat
    
    public init(radius: CGFloat,
                duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear) {
        self.radius = radius
        super.init(duration: duration, strength: strength, repeatCount: repeatCount, animationCurve: animationCurve)
    }
    
    public override func effect(_ view: UIView) {
        let fromValue = view.layer.presentation()?.cornerRadius
        let toValue = radius * strength
        let corner = CABasicAnimation()
        corner.keyPath = "cornerRadius"
        corner.fromValue = fromValue
        corner.toValue = toValue
        corner.timingFunction = animationCurve.timingFunction
        corner.duration = CFTimeInterval(duration)
        corner.repeatCount = Float(repeatCount)
        corner.fillMode = CAMediaTimingFillMode.forwards
        corner.isRemovedOnCompletion = false
        corner.delegate = self
        
        view.layer.cornerRadius = toValue
        view.layer.add(corner, forKey: "corner")
    }
}
