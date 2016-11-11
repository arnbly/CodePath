//
//  ViewController.swift
//  CustomTransition
//
//  Created by Aaron Bailey on 11/8/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField: UITextField!
    
    var lightBoxTransition: LightBoxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "greenSegue" {
        lightBoxTransition = LightBoxTransition()
        lightBoxTransition.isInteractive = true

        
        let greenViewController = segue.destination as! GreenViewController
        greenViewController.modalPresentationStyle = .custom
        greenViewController.transitioningDelegate = lightBoxTransition
        lightBoxTransition.duration = 1
        greenViewController.text = inputField.text
        }
    }
    
    @IBAction func didPinch(_ sender: UIPinchGestureRecognizer) {
        let velocity = sender.velocity
        let scale = sender.scale
        
        if sender.state == .began {
            performSegue(withIdentifier: "greenSegue", sender: nil)
        } else if sender.state == .changed {
            lightBoxTransition.percentComplete = scale / 10
            
        } else if sender.state == .ended{
            if velocity > 0 {
                lightBoxTransition.finish()
            } else {
                lightBoxTransition.cancel()
            }
        }
    }
}

