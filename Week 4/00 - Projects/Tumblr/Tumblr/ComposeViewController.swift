//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Aaron Bailey on 11/6/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    //Outputs
    @IBOutlet weak var textBtn: UIButton!
    @IBOutlet weak var photoBtn: UIButton!
    @IBOutlet weak var quoteBtn: UIButton!
    @IBOutlet weak var linkBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var nevermindBtn: UIButton!
    
    @IBOutlet var mainView: UIView!
    
    //Variables and Constants
    let animTime = 0.5

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    } // End viewDidLoad Method
    
    override func viewWillAppear(_ animated: Bool) {
        //Set buttons center 1 button height below the main frame view
        textBtn.center.y = mainView.frame.height + textBtn.frame.height
        photoBtn.center.y = mainView.frame.height + photoBtn.frame.height
        quoteBtn.center.y = mainView.frame.height + quoteBtn.frame.height
        linkBtn.center.y = mainView.frame.height + linkBtn.frame.height
        chatBtn.center.y = mainView.frame.height + chatBtn.frame.height
        videoBtn.center.y = mainView.frame.height + videoBtn.frame.height
    } // End viewWillAppear
    
    override func viewDidAppear(_ animated: Bool) {
        let rowOne = 175 as CGFloat
        let rowTwo = 320 as CGFloat
        
        UIView.animate(withDuration: animTime, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.textBtn.center.y = rowOne
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.photoBtn.center.y = rowOne
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.17, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.quoteBtn.center.y = rowOne
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.17, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.linkBtn.center.y = rowTwo
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.06, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.chatBtn.center.y = rowTwo
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.videoBtn.center.y = rowTwo
        }, completion: nil) // end animation
    } // End viewDidAppear Method
    
    @IBAction func didTapNevermind(_ sender: Any) {
        UIView.animate(withDuration: animTime, delay: 0.1, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.textBtn.center.y = 0 - self.textBtn.frame.height
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.photoBtn.center.y = 0 - self.photoBtn.frame.height
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.17, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.quoteBtn.center.y = 0 - self.quoteBtn.frame.height
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.17, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.linkBtn.center.y = 0 - self.linkBtn.frame.height
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.06, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.chatBtn.center.y = 0 - self.chatBtn.frame.height
        }, completion: nil) // end animation
        UIView.animate(withDuration: animTime, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        self.videoBtn.center.y = 0 - self.videoBtn.frame.height
        }, completion: nil) // end animation
        UIView.animateKeyframes(withDuration: 0, delay: 10, options: [], animations: { () -> Void in
                self.dismiss(animated: true, completion: nil)
        }, completion: nil)
    } // End didTapNevermind Method

} // End Body
