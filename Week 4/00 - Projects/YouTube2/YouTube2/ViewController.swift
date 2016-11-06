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
    
    let mPI = CGFloat(M_PI)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        //Set up variables for dragging feed
        feedOffset = 265
        feedClosed = feedView.center
        feedOpen = CGPoint(x: feedView.center.x + feedOffset ,y: feedView.center.y)
        
        //Set up variable for scaling the menu on drag
        menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        menuView.transform = CGAffineTransform(scaleX: 1, y: 1)

        
        //Set up variables to hold View Controllers
        let menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController")
        let feedViewController = main.instantiateViewController(withIdentifier: "FeedViewController")
    
        //Set size of the view controller contents
        feedViewController.view.frame = feedView.bounds
        menuViewController.view.bounds = menuView.bounds

        //Add view controller contents to views on the main VC
        menuView.addSubview(menuViewController.view)
        feedView.addSubview(feedViewController.view)
        
    }// End Function viewDidLoad

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
            let velocity = sender.velocity(in: view)

            //Move Object
            feedView.center = CGPoint(x: feedOriginalCenter.x + translation.x, y: feedOriginalCenter.y)
            
            if velocity.x > 0 {
                //Distance * # to calc value on a 0 to 0.1 scale. Then add to 0.9 to equal base scale of menu + translation scale
                let menuScale = translation.x * 0.0005 + 0.9
                
                //Scale Menu as user drags
                menuView.transform = CGAffineTransform(scaleX: menuScale, y: menuScale)
                
            } else {
                //Distance * # to calc value on a 0 to 0.1 scale. Then add to 0.9 to equal base scale of menu + translation scale
                let menuScale = 1 + translation.x * 0.0005
                
                //Scale Menu as user drags
                menuView.transform = CGAffineTransform(scaleX: menuScale, y: menuScale)
            }
            
            
        } else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            
            if velocity.x > 0 {
                
                // Moving Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center = self.feedOpen
                                self.menuView.transform = CGAffineTransform(scaleX: 1, y: 1)
                }, completion: nil)
                
            } else {
                
                // Moving Left
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.feedView.center = self.feedClosed
                                self.menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                }, completion: nil)
            }
            
        } else {
            print("invalid pan state")
        }

    }// End Function didPanFeed
    
    
    @IBAction func didRotateView(_ sender: UIPanGestureRecognizer) {
            //Capture Translation in variable
            let translation = sender.translation(in: view)
        
            //Reset menu from panning
        
            //Set up Rotation transform variables
            setAnchorPoint(anchorPoint: CGPoint(x: 2.5, y: 0.5), forView: feedView)
            setAnchorPoint(anchorPoint: CGPoint(x: 2.5, y: 0.5), forView: menuView)

            var transformRotate = CATransform3DIdentity;
            transformRotate.m34 = 1.0 / 1000.0;
            var menuTransRotate = CATransform3DIdentity
            menuTransRotate.m34 = 1.0 / 500.0;
        
            if sender.state == .began {
                feedOriginalCenter = feedView.center

            } else if sender.state == .changed {
                let velocity = sender.velocity(in: view)
                
                if velocity.x > 0 {
                    //Init rotation variables
                    let feedRotate = translation.x * 0.2
                    let menuRotate = translation.x * 0.2 - 30
                    
                    //Setup Calc of position based on translation
                    transformRotate = CATransform3DRotate(transformRotate, CGFloat(feedRotate * mPI / 180), 0, 1, 0)
                    feedView.layer.transform = transformRotate
                    
                    menuTransRotate = CATransform3DRotate(menuTransRotate, CGFloat(menuRotate * mPI / 180), 0, 1, 0)
                    menuView.layer.transform = menuTransRotate
                    
                } else {
                    //Init rotation variables
                    let feedRotate = 30 + translation.x * 0.2
                    let menuRotate = translation.x * 0.2

                    //Setup Calc of position based on translation
                    transformRotate = CATransform3DRotate(transformRotate, CGFloat(feedRotate * mPI / 180), 0, 1, 0)
                    feedView.layer.transform = transformRotate
                    
                    menuTransRotate = CATransform3DRotate(menuTransRotate, CGFloat(menuRotate * mPI / 180), 0, 1, 0)
                    menuView.layer.transform = menuTransRotate
                    
                } // End Left/Right Velocity if
                
            } else if sender.state == .ended {
                let velocity = sender.velocity(in: view)
                
                if velocity.x > 0 {
                    transformRotate = CATransform3DRotate(transformRotate, CGFloat(30 * mPI / 180), 0, 1, 0)
                    menuTransRotate = CATransform3DRotate(menuTransRotate, CGFloat(0 * mPI / 180), 0, 1, 0)
                    
                    //Moving Right Rotate
                    UIView.animate(withDuration:1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                                   animations: { () -> Void in
                                    self.feedView.layer.transform = transformRotate
                                    self.menuView.layer.transform = menuTransRotate
                    }, completion: nil)
                    
                } else {
                    transformRotate = CATransform3DRotate(transformRotate, CGFloat(0 * mPI / 180), 0, 1, 0)
                    menuTransRotate = CATransform3DRotate(menuTransRotate, CGFloat(-30 * mPI / 180), 0, 1, 0)
                 
                    //Moving Left Rotate
                    UIView.animate(withDuration:1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options:[] ,
                                   animations: { () -> Void in
                                    self.feedView.layer.transform = transformRotate
                                    self.menuView.layer.transform = menuTransRotate
                    }, completion: nil)
                } // End Left/Right Velocity if
                
            } else {
                print("invalid pan state")
            } // End Pan States if
            
    }// End Function didRotateFeed
    
    
    func setAnchorPoint(anchorPoint: CGPoint, forView view: UIView) {
        var newPoint = CGPoint(x: view.bounds.size.width * anchorPoint.x, y: view.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: view.bounds.size.width * view.layer.anchorPoint.x, y: view.bounds.size.height * view.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(view.transform)
        oldPoint = oldPoint.applying(view.transform)
        
        var position = view.layer.position
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        view.layer.position = position
        view.layer.anchorPoint = anchorPoint
    }// End Function setAnchorPoint

}// End Main Body

