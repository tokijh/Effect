//
//  Effectible.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public class Effectible: EffectibleType {
    public func effect<E>(_ effector: E) where E : EffectorType {
        fatalError("abstruct method")
    }
    
    public func asEffectible() -> Effectible {
        return self
    }
}
