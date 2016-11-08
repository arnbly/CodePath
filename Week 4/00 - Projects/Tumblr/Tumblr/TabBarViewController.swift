//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Aaron Bailey on 11/6/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    //Loader Var Init
    @IBOutlet weak var loaderImage: UIImageView!
    var loading_1: UIImage!
    var loading_2: UIImage!
    var loading_3: UIImage!
    var animatedImage: UIImage!
    var loaderImages: [UIImage]!
    
    //Array to hold tab bar buttons
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var composeBtn: UIButton!
    
    //To track button index
    var selectedIndex: Int = 0

    //Create Var's to hold view controllers
    var homeVC: UIViewController!
    var searchVC: UIViewController!
    var accountVC: UIViewController!
    var trendingVC: UIViewController!
    
    //VC array to map to button index
    var viewControllers: [UIViewController]!
    
    //Fade Transition Variable
    var fadeTransition: FadeTransition!

    // ---- //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Access Storyboard
        let main = UIStoryboard(name: "Main", bundle: nil)
        
        //Assign Loader Variables
        loading_1 = UIImage(named: "loading-1")
        loading_2 = UIImage(named: "loading-2")
        loading_3 = UIImage(named: "loading-3")
        loaderImages = [loading_1, loading_2, loading_3]
        animatedImage = UIImage.animatedImage(with: loaderImages, duration: 1.0)
        loaderImage.image = animatedImage
        loaderImage.alpha = 0
        
        //Create Views to load
        homeVC = main.instantiateViewController(withIdentifier: "homeVC")
        searchVC = main.instantiateViewController(withIdentifier: "searchVC")
        accountVC = main.instantiateViewController(withIdentifier: "accountVC")
        trendingVC = main.instantiateViewController(withIdentifier: "trendingVC")
        
        // Add View Controllers to VC array
        viewControllers = [homeVC, searchVC, accountVC, trendingVC]
        
        //On load set default Btn and load default VC
        buttons[selectedIndex].isSelected = true
        didPressTab(buttons[selectedIndex])
        
    } // End viewDidLoad Method
    
    @IBAction func didPressTab(_ sender: UIButton) {
        //Capture Previous Button and VC loaded
        let previousIndex = selectedIndex
        let previousVC = viewControllers[previousIndex]
        
        //Capture pressed button index and assign to VC
        selectedIndex = sender.tag
        let vc = viewControllers[selectedIndex]
        vc.view.alpha = 0
        
        //Deactivate and unload previous Btn and VC
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                    //code
                    self.buttons[previousIndex].isSelected = false
                    previousVC.willMove(toParentViewController: nil)
                    previousVC.view.removeFromSuperview()
                    previousVC.removeFromParentViewController()
                        
                    self.loaderImage.alpha = 1
        }, completion: nil) // end animation
        
        //Activate and load current Btn and VC
        UIView.animate(withDuration: 0.2, delay: 0.7, usingSpringWithDamping: 1, initialSpringVelocity: 0, options:[] ,
                       animations: { () -> Void in
                        //code
                        sender.isSelected = true
                        
                        //Size current VC and add to content box
                        vc.view.frame = self.contentView.bounds
                        self.contentView.addSubview(vc.view)
                        
                        vc.didMove(toParentViewController: self)
                        
                        vc.view.alpha = 1
                        self.loaderImage.alpha = 0
        }, completion: nil) // end animation
        
    } // End didPressTab Method
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Access the ViewController that you will be transitioning too, a.k.a, the destinationViewController.
        let destinationViewController = segue.destination
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        
        // Create a new instance of your fadeTransition.
        fadeTransition = FadeTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = fadeTransition
        
        // Adjust the transition duration. (seconds)
        fadeTransition.duration = 0.7
    }// End prepareForSegue Method
    
} // End Body
