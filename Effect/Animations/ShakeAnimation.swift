//
//  ShakeAnimation.swift
//  Effect
//
//  Created by 윤중현 on 15/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class ShakeAnimation: EffectAnimationType {
    
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
        let animation = CAKeyframeAnimation()
        animation.keyPath = direction.animationKeyPath
        animation.values = [0, 30 * strength, -30 * strength, 30 * strength, 0]
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 1]
        animation.timingFunction = animationCurve.timingFunction
        animation.duration = CFTimeInterval(duration)
        animation.isAdditive = true
        animation.repeatCount = Float(repeatCount)
        animation.delegate = self
        view.layer.add(animation, forKey: direction.animationKey)
    }
}

extension ShakeAnimation.Direction {
    var animationKeyPath: String {
        switch self {
        case .horizontal: return "position.x"
        case .vertical: return "position.y"
        }
    }
    
    var animationKey: String {
        switch self {
        case .horizontal: return "shakeHorizontal"
        case .vertical: return "shakeVertical"
        }
    }
}
