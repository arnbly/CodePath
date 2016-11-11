//
//  LightBoxTransition.swift
//  CustomTransition
//
//  Created by Aaron Bailey on 11/8/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    
        let darkShim = UIView()
    
        override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
            
            darkShim.frame = fromViewController.view.bounds
            darkShim.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            darkShim.alpha = 0
            
            toViewController.view.alpha = 0
            toViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            
            fromViewController.view.addSubview(darkShim)
            
            UIView.animate(withDuration: duration, animations: {
                toViewController.view.alpha = 1
                self.darkShim.alpha = 0.8
                
                toViewController.view.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }) { (finished: Bool) -> Void in
                self.finish()
            }
        }
        
        override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
            
            fromViewController.view.alpha = 1
            UIView.animate(withDuration: duration, animations: {
                fromViewController.view.alpha = 0
                self.darkShim.alpha = 0

                fromViewController.view.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            }) { (finished: Bool) -> Void in
                self.darkShim.removeFromSuperview()
                self.finish()
            }
        }
}
