//
//  EffectorBase.swift
//  Effect
//
//  Created by 윤중현 on 13/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

class EffectorBase: EffectorType {
    func on(_ view: UIView) {
        onCore(view)
    }
    
    func onCore(_ view: UIView) {
        fatalError("abstruct method")
    }
}
