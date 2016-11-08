//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Aaron Bailey on 11/6/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Fade Transition Variable
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }// End viewDidLoad Method

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destination
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        destinationViewController
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.7
    }// End prepareForSegue Method
}
