//
//  webViewController.swift
//  assignmentDropbox
//
//  Created by Aaron Bailey on 10/17/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit

class webViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    let url = "https://www.dropbox.com/terms?mobile=1"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Convert the url String to a NSURL object.
        let requestURL = URL(string:url)
        // Place the URL in a URL Request.
        let request = URLRequest(url: requestURL!)
        // Load Request into WebView.
        webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
