//
//  FavoritesViewController.swift
//  assignmentDropbox
//
//  Created by Aaron Bailey on 10/16/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize (width: 375, height: 428)
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
