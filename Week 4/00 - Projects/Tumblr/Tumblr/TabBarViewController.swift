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
    
    // ---- //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Access Storyboard
        let main = UIStoryboard(name: "Main", bundle: nil)
        
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
        
        //Deactivate and unload previous Btn and VC
        buttons[previousIndex].isSelected = false
        
        previousVC.willMove(toParentViewController: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParentViewController()

        //Activate and load current Btn and VC
        sender.isSelected = true
        
        //Size current VC and add to content box
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        
        vc.didMove(toParentViewController: self)
        
    } // End didPressTab Method
    
    @IBAction func didPressCompose(_ sender: UIButton) {
        
    } // End didPressCompose Method
} // End Body
