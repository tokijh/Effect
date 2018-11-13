//
//  AnyEffector.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public struct AnyEffector: EffectorType {
    
    public typealias CompleteHandler = (UIView) -> Void
    private let effector: CompleteHandler
    
    public init(completeHandler: @escaping CompleteHandler) {
        self.effector = completeHandler
    }
    
    public init<E : EffectorType>(_ effector: E) {
        self.effector = effector.on
    }
    
    public func on(_ view: UIView) {
        self.effector(view)
    }
}
