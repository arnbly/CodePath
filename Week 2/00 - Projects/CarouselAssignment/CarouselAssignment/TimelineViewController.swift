//
//  TimelineViewController.swift
//  CarouselAssignment
//
//  Created by Aaron Bailey on 10/24/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    @IBOutlet weak var timelineScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineScrollView.contentSize = CGSize (width: 375, height: 1842)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
