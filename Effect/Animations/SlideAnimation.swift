//
//  SlideAnimation.swift
//  Effect
//
//  Created by 윤중현 on 16/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class SlideAnimation: EffectAnimationType {
    
    public enum Direction {
        case left
        case right
        case down
        case up
    }
    
    var direction: Direction
    
    public init(direction: Direction,
                duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear) {
        self.direction = direction
        super.init(duration: duration, strength: strength, repeatCount: repeatCount, animationCurve: animationCurve)
    }
    
    public override func effect(_ view: UIView) {
        let slide = CABasicAnimation()
        slide.fillMode = .forwards
        slide.isRemovedOnCompletion = false
        slide.isAdditive = true
        slide.keyPath = direction.animationKeyPath
        slide.toValue = 30 * strength * direction.animationToValueDirection
        slide.timingFunction = animationCurve.timingFunction
        slide.duration = duration
        slide.repeatCount = Float(repeatCount)
        slide.delegate = self
        view.layer.add(slide, forKey: "slide")
    }
}

extension SlideAnimation.Direction {
    var animationKeyPath: String {
        switch self {
        case .left, .right: return "transform.translation.x"
        case .down, .up: return "transform.translation.y"
        }
    }
    
    var animationToValueDirection: CGFloat {
        switch self {
        case .left, .down: return -1
        case .right, .up: return 1
        }
    }
}
