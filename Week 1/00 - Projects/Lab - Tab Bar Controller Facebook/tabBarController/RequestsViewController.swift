//
//  RequestsViewController.swift
//  tabBarController
//
//  Created by Aaron Bailey on 10/13/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RequestsViewController: UIViewController {

    
    
    
    @IBOutlet weak var reqScrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reqScrollView.contentSize = CGSize(width: 375, height: 1187)
        
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
