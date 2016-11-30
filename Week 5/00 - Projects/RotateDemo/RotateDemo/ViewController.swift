//
//  ViewController.swift
//  RotateDemo
//
//  Created by Aaron Bailey on 11/10/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var originalCenterSquare: CGPoint!
    var signFlip: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signFlip = 1
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanView(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let greenView = sender.view!
        let location = sender.location(in: greenView)
        print(location.y)
        
        if sender.state == .began {
            originalCenterSquare = greenView.center
            if location.y > greenView.frame.size.height/2 {
                // Tapped Bottom Half
                signFlip = -1
            } else {
                // Tapped Top Half
                signFlip = 1
            } // end sign flip else if

        } else if sender.state == .changed {
            greenView.center.x = originalCenterSquare.x + translation.x
            
            let rotationAngle = signFlip * translation.x / 4 * CGFloat(M_PI / 180)
            greenView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
        } else if sender.state == .ended {
            
            if translation.x < 100 && translation.x > -100 {
                //return to original transition and transform
                UIView.animate(withDuration: 0.3, animations: {
                    greenView.center = self.originalCenterSquare
                    greenView.transform = CGAffineTransform.identity
                })
            } else if translation.x >= 100 {
                //fly off right
                UIView.animate(withDuration: 0.3, animations: {
                    greenView.center.x = self.view.frame.size.width + 200
                    greenView.transform = CGAffineTransform(rotationAngle: 200 / 4 * CGFloat(M_PI / 180) * self.signFlip)
                })

            } else if translation.x <= -100 {
                //fly off left
                UIView.animate(withDuration: 0.3, animations: {
                    greenView.center.x = -200
                    greenView.transform = CGAffineTransform(rotationAngle: -200 / 4 * CGFloat(M_PI / 180) * self.signFlip)
                })
            }// End Else If positioning
        }// End else if pan state change
    }//End did pan method
}

