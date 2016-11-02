//
//  RedViewController.swift
//  TabBarDemo
//
//  Created by Aaron Bailey on 11/1/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

    @IBAction func didTapRedButton(_ sender: UIButton) {
        
        sender.transform = sender.transform.translatedBy(x: 0, y: -200)

    }
    
}
