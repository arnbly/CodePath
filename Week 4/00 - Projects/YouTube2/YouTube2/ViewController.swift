//
//  ViewController.swift
//  YouTube2
//
//  Created by Aaron Bailey on 11/3/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var main = UIStoryboard(name: "Main", bundle: nil)
        
        let menuViewController = main.instantiateViewController(withIdentifier: "MenuViewController")
        let feedViewController = main.instantiateViewController(withIdentifier: "FeedViewController")
    
        feedViewController.view.frame = feedView.bounds
        menuViewController.view.bounds = menuView.bounds

        menuView.addSubview(menuViewController.view)
        feedView.addSubview(feedViewController.view)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPanFeed(_ sender: UIPanGestureRecognizer) {
                
        let translation = sender.translation(in: view)
        
        feedView.transform = feedView.transform.translatedBy(x: translation.x, y: 0)
        
        sender.setTranslation(CGPoint.zero, in: view)
    }

}

