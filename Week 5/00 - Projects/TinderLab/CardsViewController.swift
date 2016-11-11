//
//  CardsViewController.swift
//  TinderLab
//
//  Created by Aaron Bailey on 11/10/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var originalImageCenter: CGPoint!
    var signFlip: CGFloat!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        containerView.layer.cornerRadius = 5
        containerView.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPanView(_ sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        let profileImageView = sender.view!
        let location = sender.location(in: profileImageView)
        print(location.y)
        
        if sender.state == .began {
            originalImageCenter = profileImageView.center
            if location.y > profileImageView.frame.size.height/2 {
                // Tapped Bottom Half
                signFlip = -1
            } else {
                // Tapped Top Half
                signFlip = 1
            } // end sign flip else if
            
        } else if sender.state == .changed {
            profileImageView.center.x = originalImageCenter.x + translation.x
            
            let rotationAngle = signFlip * translation.x / 4 * CGFloat(M_PI / 180)
            profileImageView.transform = CGAffineTransform(rotationAngle: rotationAngle)
            
        } else if sender.state == .ended {
            
            if translation.x < 50 && translation.x > -50 {
                //return to original transition and transform
                UIView.animate(withDuration: 0.3, animations: {
                    profileImageView.center = self.originalImageCenter
                    profileImageView.transform = CGAffineTransform.identity
                })
            } else if translation.x >= 50 {
                //fly off right
                UIView.animate(withDuration: 0.3, animations: {
                    profileImageView.center.x = self.view.frame.size.width + 250
                    profileImageView.transform = CGAffineTransform(rotationAngle: 200 / 4 * CGFloat(M_PI / 180) * self.signFlip)
                })
                
            } else if translation.x <= -50 {
                //fly off left
                UIView.animate(withDuration: 0.3, animations: {
                    profileImageView.center.x = -250
                    profileImageView.transform = CGAffineTransform(rotationAngle: -200 / 4 * CGFloat(M_PI / 180) * self.signFlip)
                })
            }// End Else If positioning
        }// End else if pan state change
    }//End did pan method

    @IBAction func didTap(_ sender: Any) {
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }// End didTap Method
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let profileViewController = segue.destination as! ProfileViewController
        
            profileViewController.image = self.imageView.image
    }// End prepare for segue Method
}
