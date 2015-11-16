//
//  ViewController.swift
//  Layouting
//
//  Created by Zoran Lazic on 05/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(2,
            animations: {
                self.weatherIcon.alpha = 1;
            }, completion: { success in
                print(self.weatherIcon.alpha)
                UIView.animateWithDuration(1, delay: 0, options: [.CurveEaseIn], animations: {
                    //                        let xpos = self.location.frame.origin.x - 20
                    //                        self.location.frame = CGRectMake(xpos, self.location.frame.origin.y, self.location.frame.size.height, self.location.frame.size.width)
                    }, completion: nil)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

