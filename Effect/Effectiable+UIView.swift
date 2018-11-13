//
//  Effectiable+UIView.swift
//  Effect
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

extension UIView {
    public var effect: Effectible {
        return Effectible.create(by: self)
    }
}

extension Effectible {
    fileprivate static func create(by view: UIView) -> Effectible {
        return Effectible.create({ (effector) in
            effector.on(view)
        })
    }
}
