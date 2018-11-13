//
//  EffectibleType.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public protocol EffectibleType: EffectibleConvertibleType {
    func effect<E: EffectorType>(_ effector: E)
}

public extension EffectibleType {
    public func asEffectible() -> Effectible {
        return Effectible.create { effector in
            self.effect(effector)
        }
    }
}

extension EffectibleType {
    public func effect(_ on: @escaping (UIView) -> ()) {
        let effector = AnonymousEffector { (view) in
            on(view)
        }
        self.effect(effector)
    }
    
    public func effect() {
        self.effect { _ in }
    }
}
