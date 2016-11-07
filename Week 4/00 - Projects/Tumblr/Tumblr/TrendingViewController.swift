//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Aaron Bailey on 11/6/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Scrollview Init
        scrollView.contentSize = CGSize (width: 375, height: 1419)
        scrollView.contentInset.top = 34

    } // End viewDidLoad Method

}
