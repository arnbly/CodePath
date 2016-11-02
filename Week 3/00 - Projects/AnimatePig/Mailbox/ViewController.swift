//
//  ViewController.swift
//  Mailbox
//
//  Created by Aaron Bailey on 10/25/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pigImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapAnimatePig(_ sender: AnyObject) {
        //        UIView.animate(withDuration: 0.6) {
        //            self.pigImageView.center.y += 150
        //
        //        }
        
        
        UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.curveEaseInOut], animations: {
            self.pigImageView.center.y += 300
            })
        { (Bool) in
            UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
                self.pigImageView.transform = CGAffineTransform(rotationAngle: -25 * CGFloat(M_PI / 180))
                }, completion: nil)
            UIView.animate(withDuration: 2, delay: 1, options: [UIViewAnimationOptions.autoreverse, UIViewAnimationOptions.repeat, UIViewAnimationOptions.curveEaseInOut], animations: {
//                self.pigImageView.transform = CGAffineTransform(rotationAngle: 25 * CGFloat(M_PI / 180))
                self.pigImageView.transform = self.pigImageView.transform.rotated(by: 45 * CGFloat(M_PI) / 180)

                }, completion: nil)
        }
        
    }
    
    @IBAction func springPig(_ sender: AnyObject) {
        
        
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.1, initialSpringVelocity: 20, options: [], animations: {
            self.pigImageView.transform = self.pigImageView.transform.translatedBy(x: 0, y: -250)

            }) { (Bool) in
                UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: { 
                    self.pigImageView.transform = CGAffineTransform.identity

                    }, completion: nil)
        }
        
    }
    
    @IBAction func rotatePig(_ sender: AnyObject) {
        
        pigImageView.transform = pigImageView.transform.rotated(by: 45 * CGFloat(M_PI) / 180)


    }
    
    @IBAction func roateBy(_ sender: AnyObject) {
        pigImageView.transform = CGAffineTransform(rotationAngle: 25 * CGFloat(M_PI / 180))
    }
}

