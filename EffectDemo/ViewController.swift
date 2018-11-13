//
//  ViewController.swift
//  EffectDemo
//
//  Created by 윤중현 on 14/11/2018.
//  Copyright © 2018 tokijh. All rights reserved.
//

import UIKit
import Effect

class ViewController: UIViewController {
    
    @IBOutlet weak var button: NSLayoutConstraint!
    
    @IBAction func onClicked(_ view: UIButton) {
        view.effect
            .do({ (view) in
                print("Start FadeAnimation(duration: 4)",
                      Date().timeIntervalSince1970)
            })
            .animate(FadeAnimation(duration: 4))
            .do({ (view) in
                print("End FadeAnimation(duration: 4)",
                      Date().timeIntervalSince1970)
            })
            .delay(2)
            .effect { (view) in
                print("End delay 2 seconds",
                      Date().timeIntervalSince1970)
            }
    }
}

class FadeAnimation: AnimationType {
    var duration: TimeInterval
    
    init(duration: TimeInterval) {
        self.duration = duration
    }
    
    func effect(_ view: UIView) {
        UIView.animate(withDuration: duration / 2, animations: {
            view.alpha = 0.0
        }, completion: { _ in
            UIView.animate(withDuration: self.duration / 2, animations: {
                view.alpha = 1.0
            }, completion: { _ in
                self.completedHandler?()
            })
        })
    }
    
    var completedHandler: CompletedHandler?
}
