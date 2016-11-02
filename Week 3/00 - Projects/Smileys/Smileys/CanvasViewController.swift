//
//  CanvasViewController.swift
//  Smileys
//
//  Created by Aaron Bailey on 10/27/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    @IBOutlet weak var drawerArrow: UIImageView!
    
    var trayOriginalCenter: CGPoint!
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var newlyCreatedFace: UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trayDownOffset = 175
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanView(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            trayOriginalCenter = trayView.center

            
        } else if sender.state == .changed {
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)


            
        } else if sender.state == .ended {
            let velocity = sender.velocity(in: view)
            
            if velocity.y > 0 {
                // Moving Down
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayDown
                    }, completion: nil)
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                    //animate arrow
                    self.drawerArrow.transform = CGAffineTransform(rotationAngle: CGFloat(180 * M_PI / 180))
                    }, completion: nil)
                
            } else {
                // Moving Up
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayUp
                    }, completion: nil)
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: {
                        //animate arrow
                        self.drawerArrow.transform = CGAffineTransform(rotationAngle: CGFloat(0 * M_PI / 180))
                    }, completion: nil)
                
                
            }

            
        } else {
            print("invalid pan state")
        }
    
    
    }

    @IBAction func didPanFace(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            let imageView = sender.view as! UIImageView
            
            //Create and add image to subview
            newlyCreatedFace = UIImageView(image: imageView.image)
            view.addSubview(newlyCreatedFace)
            newlyCreatedFace.center = imageView.center
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
            //Add and enable pan on new view
            let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(didPan(sender:)))
            newlyCreatedFace.isUserInteractionEnabled = true
            newlyCreatedFace.addGestureRecognizer(panGestureRecognizer)
            
            //Add and enable Pinch on new view
            let pinchGestureRecognizer = UIPinchGestureRecognizer (target: self, action: #selector(didPinch(sender:)))
            newlyCreatedFace.addGestureRecognizer(pinchGestureRecognizer)
            
            //Add and enable rotate on new view
            let rotateGestureRecognizer = UIRotationGestureRecognizer (target: self, action: #selector(didRotate(sender:)))
            newlyCreatedFace.addGestureRecognizer(rotateGestureRecognizer)
            
            //Add and enable tap on new view
            let tapGestureRecognizer = UITapGestureRecognizer (target: self, action: #selector(didDoubleTap))
            newlyCreatedFace.addGestureRecognizer(tapGestureRecognizer)
            tapGestureRecognizer.numberOfTapsRequired = 2;

            
            
            
            //Position and animate face
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                           animations: { () -> Void in
                            self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 2, y: 2)
                }, completion: nil)

        
        } else if sender.state == .changed {
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
            
        } else if sender.state == .ended {
            UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                           animations: { () -> Void in
                            self.newlyCreatedFace.transform = self.newlyCreatedFace.transform.scaledBy(x: 0.8, y: 0.8)
                }, completion: nil)
        } else {
            print("invalid pan state")
        }
        
    }
    
    func didPan(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        
        if sender.state == .began {
            print("Gesture began")
            newlyCreatedFace = sender.view as! UIImageView
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
        } else if sender.state == .changed {
            print("Gesture is changing")
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)

            
        } else if sender.state == .ended {
            print("Gesture ended")
            
        }
    }
    
    func didPinch(sender: UIPinchGestureRecognizer) {
        //let translation = sender.translation(in: view)
        let scale = sender.scale
        
        newlyCreatedFace.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    
    func didRotate(sender: UIRotationGestureRecognizer) {
        let rotate = sender.rotation
        
        newlyCreatedFace.transform = newlyCreatedFace.transform.rotated(by: rotate)
        sender.rotation = 0
    }
    
    func didDoubleTap(sender: UITapGestureRecognizer) {
        
        print("tapped")
        newlyCreatedFace.removeFromSuperview()
    }

//END
}
