//
//  ZoomAnimation.swift
//  Effect
//
//  Created by 윤중현 on 25/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class ZoomAnimation: EffectAnimationType {
    
    var zoom: CGFloat
    
    public init(zoom: CGFloat,
                duration: TimeInterval = 1.0,
                strength: CGFloat = 1.0,
                repeatCount: Int = 1,
                animationCurve: AnimationCurve = .linear) {
        self.zoom = zoom
        super.init(duration: duration, strength: strength, repeatCount: repeatCount, animationCurve: animationCurve)
    }
    
    public override func effect(_ view: UIView) {
        let fromValue = view.layer.presentation()?.contentsScale
        let toValue = zoom * strength
        let zoomAnimation = CABasicAnimation()
        zoomAnimation.keyPath = "transform.scale"
        zoomAnimation.fromValue = fromValue
        zoomAnimation.toValue = toValue
        zoomAnimation.timingFunction = animationCurve.timingFunction
        zoomAnimation.duration = CFTimeInterval(duration)
        zoomAnimation.repeatCount = Float(repeatCount)
        zoomAnimation.fillMode = CAMediaTimingFillMode.forwards
        zoomAnimation.isRemovedOnCompletion = false
        zoomAnimation.delegate = self
        
        view.layer.contentsScale = toValue
        view.layer.add(zoomAnimation, forKey: "zoom")
    }
}
