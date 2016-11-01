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
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var scheduleView: UIView!
    
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
        archiveIcon.alpha = 0.7
        laterIcon.alpha = 0.7
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let firstStep: CGFloat = 65
        let secondStep: CGFloat = 200
        let firstNStep: CGFloat = -65
        let secondNStep: CGFloat = -200

        if sender.state == .began {
            
            print("began")
            
            //Initalize Image Positions
            messageOriginalCenter = messageView.center
            feedOriginalCenter = feedImage.center
            laterIconOriginal = laterIcon.center
            archiveIconOriginal = archiveIcon.center
            
        } else if sender.state == .changed {
            
            print("changed")
            
            messageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            
            if translation.x > firstStep && translation.x < secondStep {
                //Archive - Green
                view.backgroundColor = UIColor.init(red: 68/255, green: 213/255, blue: 25/255, alpha: 1)
                
                //Fade in Archive Icon
                UIView.animate(withDuration: 0.2, animations: {
                    self.archiveIcon.alpha = 1
                })
                
                //Hide later icon for clear
                laterIcon.alpha = 0
                
                //Move Icon
                archiveIcon.center = CGPoint(x: messageView.center.x - 217, y: archiveIconOriginal.y)
                
                //Swap Image back to archive icon
                archiveIcon.image = UIImage(named: "archive_icon")
                
            } else if translation.x > secondStep {
                //Delete - Red
                view.backgroundColor = UIColor.init(red: 1, green: 98/255, blue: 39/255, alpha: 1)
                
                //Swap Image to Delete
                archiveIcon.image = UIImage(named: "delete_icon")
                
                //Move Icon
                archiveIcon.center = CGPoint(x: messageView.center.x - 217, y: archiveIconOriginal.y)
                
            } else if translation.x < firstNStep && translation.x > secondNStep {
                //Later - yellow
                view.backgroundColor = UIColor.init(red: 255/255, green: 218/255, blue: 39/255, alpha: 1)
                
                //Fade in Later Icon
                UIView.animate(withDuration: 0.2, animations: {
                    self.laterIcon.alpha = 1
                })
                
                //Hide Archive icon for clear
                archiveIcon.alpha = 0
                
                //Move Icon
                laterIcon.center = CGPoint(x: messageView.center.x + 217, y: laterIconOriginal.y)
                
                //Swap Image back to later
                laterIcon.image = UIImage(named: "later_icon")

                
            } else if translation.x < secondNStep {
                //Menu - Brown
                view.backgroundColor = UIColor.init(red: 209/255, green: 187/255, blue: 160/255, alpha: 1)
                
                //Swap Image to list
                laterIcon.image = UIImage(named: "list_icon")
                
                //Move Icon
                laterIcon.center = CGPoint(x: messageView.center.x + 217, y: laterIconOriginal.y)

            } else {
                view.backgroundColor = UIColor.lightGray
                //Re-instate opacity of icons
                archiveIcon.alpha = 0.7
                laterIcon.alpha = 0.7
            }
            
            
        } else if sender.state == .ended {
            print("ended")
            
            if translation.x > 75 {
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
                
            } else if translation.x < secondNStep {
                //Show Reschedule View
                UIView.animate(withDuration: 0.4, animations: {
                    self.scheduleView.alpha = 1
                })
            
            } else if translation.x > secondNStep && translation.x < firstNStep {
                //Show List View
                
                UIView.animate(withDuration: 0.4, animations: { 
                    self.listView.alpha = 1
                })
                
                
                print("Clear Message Left")

                
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
    
    
    @IBAction func clearViews(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4, animations: {
            self.listView.alpha = 0
            self.scheduleView.alpha = 0
        })
        
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
