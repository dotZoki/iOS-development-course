//
//  ViewController.swift
//  ImageViewer
//
//  Created by Zoran Lazic on 02/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "slika1" {
            let vc = segue.destinationViewController as! DetailViewController
            vc.slika = (sender as! UIButton).imageForState(.Normal)
        //}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

