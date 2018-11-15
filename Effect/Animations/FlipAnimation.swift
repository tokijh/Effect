//
//  FlipAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class FlipAnimation: EffectAnimationType {
    
    public enum Direction {
        case horizontal
        case vertical
    }
    
    var direction: Direction
    
    public init(duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear,
                direction: Direction = .horizontal) {
        self.direction = direction
        super.init(duration: duration, strength: strength, repeatCount: repeatCount, animationCurve: animationCurve)
    }
    
    public override func effect(_ view: UIView) {
        var perspective = CATransform3DIdentity
        perspective.m34 = -1.0 / view.layer.frame.size.width / 2
        
        let animation = CABasicAnimation()
        animation.keyPath = "transform"
        animation.fromValue = NSValue(caTransform3D: CATransform3DMakeRotation(0, 0, 0, 0))
        animation.toValue = NSValue(caTransform3D: CATransform3DConcat(perspective, direction.aniamtionToValue))
        animation.duration = CFTimeInterval(duration)
        animation.repeatCount = Float(repeatCount)
        animation.timingFunction = animationCurve.timingFunction
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.isRemovedOnCompletion = false
        animation.isAdditive = true
        animation.delegate = self
        view.layer.add(animation, forKey: direction.animationKey)
    }
}

extension FlipAnimation.Direction {
    var aniamtionToValue: CATransform3D {
        switch self {
        case .horizontal: return CATransform3DMakeRotation(CGFloat.pi, 0, 1, 0)
        case .vertical: return CATransform3DMakeRotation(CGFloat.pi, 1, 0, 0)
        }
    }
    
    var animationKey: String {
        switch self {
        case .horizontal: return "flipHorizontal"
        case .vertical: return "flipVertical"
        }
    }
}
