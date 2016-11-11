//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var originalY = toViewController.view.frame.origin.y
        
        toViewController.view.alpha = 0
        toViewController.view.frame.origin.y -= toViewController.view.frame.size.height
        UIView.animate(withDuration: duration, animations: {
            toViewController.view.alpha = 1
            toViewController.view.frame.origin.y = originalY
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
  
        fromViewController.view.alpha = 1
        UIView.animate(withDuration: duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.frame.origin.y -= fromViewController.view.frame.size.height
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
}
