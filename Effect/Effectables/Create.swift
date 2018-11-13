//
//  Create.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

extension Effectible {
    public static func create(_ effect: @escaping (AnyEffector) -> ()) -> Effectible {
        return AnonymousEffectible(effect)
    }
}

final fileprivate class AnonymousEffectibleSink<E: EffectorType>: Sink<E>, EffectorType {
    typealias Parent = AnonymousEffectible
    
    func on(_ view: UIView) {
        forwardOn(view)
    }
    
    func run(_ parent: Parent) {
        parent._effectHandler(AnyEffector(self))
    }
}

final fileprivate class AnonymousEffectible: Effectible {
    typealias EffectHandler = (AnyEffector) -> ()
    
    fileprivate let _effectHandler: EffectHandler
    
    init(_ effectHandler: @escaping EffectHandler) {
        _effectHandler = effectHandler
    }
    
    override func effect<E: EffectorType>(_ effector: E) {
        let sink = AnonymousEffectibleSink(effector: effector)
        sink.run(self)
    }
}
