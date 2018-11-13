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
