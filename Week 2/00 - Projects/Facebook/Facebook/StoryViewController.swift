//
//  StoryViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentField: UITextField!
    @IBOutlet weak var commentContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = imageView.image!.size
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.contentInset.top = 0
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.top = 0
        scrollView.scrollIndicatorInsets.bottom = 0
        
        scrollView.sendSubview(toBack: imageView)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillShow, object: nil, queue: nil, using: { (notification: Notification!) -> Void in
            var userInfo = (notification! as NSNotification).userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            let kbSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue.size
            let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            let animationDuration = durationValue.doubleValue
            let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationCurve = curveValue.intValue

            
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
                self.commentContainer.frame.origin.y = self.view.frame.size.height - kbSize.height - self.commentContainer.frame.size.height
            }, completion: nil)
        })
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification: Notification!) -> Void in
            var userInfo = (notification! as NSNotification).userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
            let durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber
            let animationDuration = durationValue.doubleValue
            let curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! NSNumber
            let animationCurve = curveValue.intValue
            
            UIView.animate(withDuration: animationDuration, delay: 0.0, options: UIViewAnimationOptions(rawValue: UInt(animationCurve << 16)), animations: {
                self.commentContainer.frame.origin.y = self.scrollView.frame.size.height + self.scrollView.frame.origin.y
                }, completion: nil)
            })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCommentButton(_ sender: AnyObject) {
        commentField.becomeFirstResponder()
    }
    
    @IBAction func onBackButton(_ sender: AnyObject) {
        navigationController!.popViewController(animated: true)
    }

    @IBAction func onLikeButton(_ sender: AnyObject) {
        likeButton.isSelected = !likeButton.isSelected
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onEditingBegan(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 2, animations: { () -> Void in
            self.commentContainer.center = CGPoint(x: 170, y: 100)
            self.commentContainer.alpha = 0.5
            self.commentContainer.backgroundColor = UIColor.red
            
        })
    }
}
