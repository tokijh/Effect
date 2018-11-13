//
//  Delay.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

extension EffectibleType {
    public func delay(_ dueTime: TimeInterval, dispatchQueue: DispatchQueue = DispatchQueue.main) -> Effectible {
        return Delay(source: self.asEffectible(), dueTime: dueTime, dispatchQueue: dispatchQueue)
    }
}

final fileprivate class DelaySink<E: EffectorType>: Sink<E>, EffectorType {
    
    private let _dueTime: TimeInterval
    private let _dispatchQueue: DispatchQueue
    
    init(effector: E, dueTime: TimeInterval, dispatchQueue: DispatchQueue) {
        _dueTime = dueTime
        _dispatchQueue = dispatchQueue
        super.init(effector: effector)
    }
    
    func on(_ view: UIView) {
        _dispatchQueue.asyncAfter(deadline: .now() + _dueTime) {
            self.forwardOn(view)
        }
    }
    
    func run(source: Effectible) {
        source.effect(self)
    }
}

final fileprivate class Delay: Effectible {
    
    private let _source: Effectible
    private let _dueTime: TimeInterval
    private let _dispatchQueue: DispatchQueue
    
    init(source: Effectible, dueTime: TimeInterval, dispatchQueue: DispatchQueue) {
        _source = source
        _dueTime = dueTime
        _dispatchQueue = dispatchQueue
    }
    
    override func effect<E: EffectorType>(_ effector: E) {
        let sink = DelaySink(effector: effector, dueTime: _dueTime, dispatchQueue: _dispatchQueue)
        sink.run(source: _source)
    }
}

