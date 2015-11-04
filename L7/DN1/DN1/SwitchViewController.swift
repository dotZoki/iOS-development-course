//
//  SwitchViewController.swift
//  DN1
//
//  Created by Zoran Lazic on 04/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class SwitchViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("switch vc")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("SEGUE")
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
