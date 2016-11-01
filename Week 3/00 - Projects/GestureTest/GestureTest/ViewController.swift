//
//  ViewController.swift
//  GestureTest
//
//  Created by Aaron Bailey on 10/25/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bikerImage: UIImageView!
    
    var bikerOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        bikerOriginalCenter = bikerImage.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapBiker(_ sender: AnyObject) {
        
        UIView.animate(withDuration: 0.03, animations: {
            self.bikerImage.transform = CGAffineTransform.identity
        
            UIView.animate(withDuration: 0.5, delay: 0.03, usingSpringWithDamping: 0.1, initialSpringVelocity: 100, options: [], animations: {
            self.bikerImage.transform = CGAffineTransform(translationX: 10, y: 0)
            
            }) { (Bool) in
                
            }
        })
        
        let alertController = UIAlertController(title: "Woah Dude!", message: "Don't tap me bro!", preferredStyle: .alert)
        
        let sorryAction = UIAlertAction(title: "Sorry Man", style: .default, handler: nil)
        
        alertController.addAction(sorryAction)
        present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func didPanBiker(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began {
            bikerOriginalCenter = bikerImage.center

        } else if sender.state == .changed{
        
            let location = sender.location(in: view)
            let translation = sender.translation(in: view)
        
            print("x: \(location.x), y: \(location.y)")
            print("x: \(translation.x), y: \(translation.y)")
        
            bikerImage.center = CGPoint(x: bikerOriginalCenter.x + translation.x, y: bikerOriginalCenter.y + translation.y)
        }

    }
    
    @IBAction func pinchBIker(_ sender: UIPinchGestureRecognizer) {
        
        let scale = sender.scale
        
        bikerImage.transform = CGAffineTransform(scaleX: scale, y: scale)
        
    }
    
    
    @IBAction func rotateBiker(_ sender: UIRotationGestureRecognizer) {
        
        let rotate = sender.rotation
        
        bikerImage.transform = bikerImage.transform.rotated(by: rotate)
        sender.rotation = 0
    }

}

