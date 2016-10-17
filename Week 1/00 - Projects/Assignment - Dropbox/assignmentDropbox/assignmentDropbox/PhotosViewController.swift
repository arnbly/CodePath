//
//  PhotosViewController.swift
//  assignmentDropbox
//
//  Created by Aaron Bailey on 10/16/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var photoScroll: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        photoScroll.contentSize = CGSize(width: 375,height: 733)
        

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
