//
//  MessageViewController.swift
//  MailboxAssignment
//
//  Created by Aaron Bailey on 10/31/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var archiveIcon: UIImageView!
    @IBOutlet weak var laterIcon: UIImageView!
    @IBOutlet weak var feedImage: UIImageView!
    
    var messageOriginalCenter: CGPoint!
    var feedOriginalCenter: CGPoint!
    var laterIconOriginal: CGPoint!
    var archiveIconOriginal: CGPoint!
    
    var messageOffset: CGFloat!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 375, height: 1602)
        
        //Distance to push cleared messages off screen
        messageOffset = 175
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let firstStep: CGFloat = 75
        let secondStep: CGFloat = 150
        let firstNStep: CGFloat = -75
        let secondNStep: CGFloat = -150

        if sender.state == .began {
            
            print("began")
            
            //Initalize Image Positions
            messageOriginalCenter = messageView.center
            feedOriginalCenter = feedImage.center
            
            
        } else if sender.state == .changed {
            
            print("changed")
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x > firstStep && translation.x < secondStep {
                //Archive - Green
                view.backgroundColor = UIColor.init(red: 68/255, green: 213/255, blue: 25/255, alpha: 1)
                
                //Hide later icon for clear
                laterIcon.alpha = 0
                
            } else if translation.x > secondStep {
                //Delete - Red
                view.backgroundColor = UIColor.init(red: 1, green: 98/255, blue: 39/255, alpha: 1)
                
            } else if translation.x < firstNStep && translation.x > secondNStep {
                //Later - yellow
                view.backgroundColor = UIColor.init(red: 255/255, green: 218/255, blue: 39/255, alpha: 1)
                
                //Hide Archive icon for clear
                archiveIcon.alpha = 0
                
            } else if translation.x < secondNStep {
                //Menu - Brown
                view.backgroundColor = UIColor.init(red: 209/255, green: 187/255, blue: 160/255, alpha: 1)

            } else {
                view.backgroundColor = UIColor.lightGray
                //Re-instate opacity of icons
                archiveIcon.alpha = 1
                laterIcon.alpha = 1
            }
            
            
        } else if sender.state == .ended {
            print("ended")
            
            if translation.x > 100 {
                print("Clear Message Right")
                //Clear Message Right
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                               animations: { () -> Void in
                                //code
                                self.messageView.center = CGPoint(x: self.messageOriginalCenter.x + 375, y: self.messageOriginalCenter.y)
                                //Hide Archive icon for clear
                                self.archiveIcon.alpha = 0
                                self.laterIcon.alpha = 0
                    }, completion: nil)
                
                //Animate Scroll View Up
                UIView.animate(withDuration: 0.4, delay: 0.4, animations: {
                    self.feedImage.center = CGPoint(x: self.feedOriginalCenter.x, y: self.feedOriginalCenter.y - 100)
                    self.view.backgroundColor = UIColor.white
                })
                
            } else if translation.x < -100 {
                print("Clear Message Left")
                //Clear Message Left
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                               animations: { () -> Void in
                                //code
                                self.messageView.center = CGPoint(x: self.messageOriginalCenter.x - 375, y: self.messageOriginalCenter.y)
                                //Hide Archive icon for clear
                                self.archiveIcon.alpha = 0
                                self.laterIcon.alpha = 0
                    }, completion: nil)
                
                //Animate Scroll View Up
                UIView.animate(withDuration: 0.4, delay: 0.4, animations: {
                    self.feedImage.center = CGPoint(x: self.feedOriginalCenter.x, y: self.feedOriginalCenter.y - 100)
                    self.view.backgroundColor = UIColor.white
                })

            } else {
                //Return Message to center
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                //code
                                self.messageView.center = self.messageOriginalCenter
                    }, completion: nil)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
