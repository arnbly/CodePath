//
//  TanBarViewController.swift
//  TabBarDemo
//
//  Created by Aaron Bailey on 11/1/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class TanBarViewController: UIViewController {

    @IBOutlet weak var containerView: UIScrollView!
    
    var redViewController: UIViewController!
    var greenViewController: UIViewController!
    var blueViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.contentSize = CGSize(width: containerView.frame.size.width*3, height: containerView.frame.size.height)
        
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        redViewController = main.instantiateViewController(withIdentifier: "RedViewController")
        redViewController.view.frame = containerView.bounds
        
        blueViewController = main.instantiateViewController(withIdentifier: "BlueViewController")
        blueViewController.view.frame = containerView.bounds
        //Offset View For Scroll
        blueViewController.view.frame.origin.x = containerView.frame.size.width
        
        greenViewController = main.instantiateViewController(withIdentifier: "GreenViewController")
        greenViewController.view.frame = containerView.bounds
        //Double Offset view for scroll
        greenViewController.view.frame.origin.x = containerView.frame.size.width*2
        
        
        //Adding subviews for scroll nav
        containerView.addSubview(redViewController.view)
        containerView.addSubview(greenViewController.view)
        containerView.addSubview(blueViewController.view)
        
        //Demo of what a cgpoint looks like
        let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height: 10))
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didTapRed(_ sender: AnyObject) {
        //Positioning for scroll
        containerView.setContentOffset(CGPoint(x: 0,y: 0), animated: true)
        
        //Adding and removing views with no scroll
//        blueViewController.willMove(toParentViewController: nil)
//        blueViewController.view.removeFromSuperview()
//        blueViewController.removeFromParentViewController()
//        
//        greenViewController.willMove(toParentViewController: nil)
//        greenViewController.view.removeFromSuperview()
//        greenViewController.removeFromParentViewController()
//        
//        addChildViewController(redViewController)
//        containerView.addSubview(redViewController.view)
//        redViewController.didMove(toParentViewController: self)
        
    }
    
    
    @IBAction func didTapBlue(_ sender: AnyObject) {
        //positioning for scroll
        containerView.setContentOffset(CGPoint(x: containerView.frame.size.width,y: 0), animated: true)

        
        //Adding and removing views with no scroll
//        redViewController.willMove(toParentViewController: nil)
//        redViewController.view.removeFromSuperview()
//        redViewController.removeFromParentViewController()
//        
//        greenViewController.willMove(toParentViewController: nil)
//        greenViewController.view.removeFromSuperview()
//        greenViewController.removeFromParentViewController()
//        
//        addChildViewController(blueViewController)
//        containerView.addSubview(blueViewController.view)
//        redViewController.didMove(toParentViewController: self)
//        
    }
    
    @IBAction func didTapGreen(_ sender: AnyObject) {
        //Positioning for scroll
        containerView.setContentOffset(CGPoint(x: containerView.frame.size.width*2,y: 0), animated: true)

        
        //Adding and removing views with no scroll
//        redViewController.willMove(toParentViewController: nil)
//        redViewController.view.removeFromSuperview()
//        redViewController.removeFromParentViewController()
//        
//        blueViewController.willMove(toParentViewController: nil)
//        blueViewController.view.removeFromSuperview()
//        blueViewController.removeFromParentViewController()
//        
//        containerView.addSubview(greenViewController.view)
//        addChildViewController(greenViewController)
//        greenViewController.didMove(toParentViewController: self)

        
    }
    
    

}
