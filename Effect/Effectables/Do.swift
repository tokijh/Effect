//
//  Do.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

extension EffectibleType {
    public func `do`(_ on: ((UIView) -> ())? = nil, onEffect: (() -> ())? = nil, onEffected: (() -> ())? = nil) -> EffectibleType {
        return Do(source: self.asEffectible(), effectHandler: { view in
            on?(view)
        }, onEffect: onEffect, onEffected: onEffected)
    }
}

final fileprivate class DoSink<E: EffectorType>: Sink<E>, EffectorType{
    
    typealias EffectHandler = (UIView) -> ()
    
    private let _effectHandler: EffectHandler
    
    init(effectHandler: @escaping EffectHandler, effector: E) {
        _effectHandler = effectHandler
        super.init(effector: effector)
    }
    
    func on(_ view: UIView) {
        _effectHandler(view)
        forwardOn(view)
    }
    
    func run(source: Effectible) {
        source.effect(self)
    }
}

final fileprivate class Do: Effectible {
    
    typealias EffectHandler = (UIView) -> ()
    
    fileprivate let _source: Effectible
    fileprivate let _effectHandler: EffectHandler
    fileprivate let _onEffect: (() -> ())?
    fileprivate let _onEffected: (() -> ())?
    
    init(source: Effectible, effectHandler: @escaping EffectHandler, onEffect: (() -> ())?, onEffected: (() -> ())?) {
        _source = source
        _effectHandler = effectHandler
        _onEffect = onEffect
        _onEffected = onEffected
    }
    
    override func effect<E: EffectorType>(_ effector: E) {
        let sink = DoSink(effectHandler: _effectHandler, effector: effector)
        _onEffect?()
        sink.run(source: _source)
        _onEffected?()
    }
}
