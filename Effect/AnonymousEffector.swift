//
//  AnonymousEffector.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

final class AnonymousEffector: EffectorBase {
    typealias EffectHandler = (UIView) -> Void
    
    private let _effectHandler : EffectHandler
    
    init(_ effectHandler: @escaping EffectHandler) {
        _effectHandler = effectHandler
    }
    
    override func onCore(_ view: UIView) {
        return _effectHandler(view)
    }
}
