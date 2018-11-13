//
//  AnimationType.swift
//  Effect
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

public protocol AnimationType: class {
    typealias CompletedHandler = () -> ()
    func effect(_ view: UIView)
    var completedHandler: CompletedHandler? { get set }
}
