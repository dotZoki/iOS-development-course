//
//  SendMsgViewController.swift
//  DN1
//
//  Created by Zoran Lazic on 04/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class SendMsgViewController: UIViewController {

    @IBOutlet weak var msg: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Loaded SEND MSG ctrl")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMsg(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setObject(msg.text, forKey: "Messages")
        NSUserDefaults.standardUserDefaults().synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
