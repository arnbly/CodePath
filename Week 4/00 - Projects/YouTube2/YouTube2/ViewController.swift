//
//  ViewController.swift
//  YouTube2
//
//  Created by Aaron Bailey on 11/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var feedOriginalCenter: CGPoint!
    var feedOffset: CGFloat!
    var feedClosed: CGPoint!
    var feedOpen: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var main = UIStoryboard(name: "Main", bundle: nil)
        
        feedOffset = 265
        feedClosed = feedView.center
        feedOpen = CGPoint(x: feedView.center.x + feedOffset ,y: feedView.center.y)
        
        let menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController")
        let feedViewController = main.instantiateViewController(withIdentifier: "FeedViewController")
    
        feedViewController.view.frame = feedView.bounds
        menuViewController.view.bounds = menuView.bounds

        menuView.addSubview(menuViewController.view)
        feedView.addSubview(feedViewController.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
        //Capture Translation in variable
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            feedOriginalCenter = feedView.center
            
        } else if sender.state == .changed {
            //Move Object
            feedView.center = CGPoint(x: feedOriginalCenter.x + translation.x, y: feedOriginalCenter.y)
            
            //Reset Translation to 0
            //sender.setTranslation(CGPoint.zero, in: view)
        } else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            
            if velocity.x > 0 {
                // Moving Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center = self.feedOpen
                }, completion: nil)

                
            } else {
                // Moving Left
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center = self.feedClosed
                }, completion: nil)
                
                
            }
            
            
        } else {
            print("invalid pan state")
        }
        
        
        
    }

}

