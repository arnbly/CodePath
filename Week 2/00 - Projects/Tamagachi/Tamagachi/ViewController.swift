//
//  ViewController.swift
//  Tamagachi
//
//  Created by Aaron Bailey on 10/18/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var initialOrigin: CGPoint!
    
    @IBOutlet weak var bunnyImageView: UIImageView!
    @IBOutlet weak var responseField: UILabel!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        responseField.text = "Hi there! 🤘"
        initialOrigin = bunnyImageView.center
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func didPressSend(_ sender: AnyObject) {
        responseField.text = ""
        activityIndicator.startAnimating()
        
        if inputField.text == "What is your name?" {
            delay(0.6, closure: {
                self.activityIndicator.stopAnimating()
                self.responseField.text = "What's it to you, chump?"
            })
            inputField.text = ""

        } else if inputField.text == "Are you hungry?"{
            delay(0.6, closure: {
                self.responseField.text = "Toast?"
                self.activityIndicator.stopAnimating()
                })
            inputField.text = ""

        } else if inputField.text == "Really?"{
            delay(0.6, closure: {
                self.responseField.text = "TOAST!"
                self.activityIndicator.stopAnimating()
                })
            inputField.text = ""

        } else {
            delay(0.6, closure: {
                self.responseField.text = "Carrot?"
                self.activityIndicator.stopAnimating()
                })
            inputField.text = ""
            self.bunnyImageView.transform = self.bunnyImageView.transform.rotated(by: CGFloat(-10 * M_PI/180))

        }
    }
    
    @IBAction func tapBackground(_ sender: AnyObject) {
        view.endEditing(true)
        print("test")
    }
    
    
    @IBAction func didPressRight(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.center.x = self.bunnyImageView.center.x + 20
        }
    }

    @IBAction func didPressUp(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.center.y = self.bunnyImageView.center.y - 20
        }
    }
    
    @IBAction func didPressDown(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.center.y = self.bunnyImageView.center.y + 20
        }
    }
    
    @IBAction func didPressLeft(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.center.x = self.bunnyImageView.center.x - 20
        }
    }
    
    @IBAction func rotateRight(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.transform = self.bunnyImageView.transform.rotated(by: CGFloat(20 * M_PI/180))
        }
    }
    
    @IBAction func rotateLeft(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3){
        self.bunnyImageView.transform = self.bunnyImageView.transform.rotated(by: CGFloat(-20 * M_PI/180))
        }
    }
    
    @IBAction func shrinkBunny(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3){
        self.bunnyImageView.transform = self.bunnyImageView.transform.scaledBy(x: 1.2, y: 1.2)
        }
    }
    
    @IBAction func growBunny(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.transform = self.bunnyImageView.transform.scaledBy(x: 0.8, y: 0.8)
        }
    }
    
    @IBAction func resetPress(_ sender: AnyObject) {
        bunnyImageView.center = initialOrigin
        UIView.animate(withDuration: 0.3){
            self.bunnyImageView.transform = CGAffineTransform.identity
        }
    }
    
    
}

