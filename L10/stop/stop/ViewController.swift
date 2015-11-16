//
//  ViewController.swift
//  stop
//
//  Created by Zoran Lazic on 16/11/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 30
    
    @IBOutlet weak var timeDisplay: UILabel!
    @IBOutlet weak var startOrStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countdownStart(sender: UIButton) {
        
        if !timer.valid {
            startOrStop.setTitle("STOP", forState: UIControlState.Normal)
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateCount", userInfo: nil, repeats: true)
        } else {
            self.stopTimer()
        }
    }
    
    func stopTimer() {
        timer.invalidate()
        startOrStop.setTitle("START", forState: UIControlState.Normal)
        count = 30
        
        self.updateDisplay()
    }
    
    func updateCount() {
        count -= 1
        self.updateDisplay()
    }
    
    func updateDisplay() {
        var numberDisplay : NSMutableAttributedString
        numberDisplay = NSMutableAttributedString(string:"\(count)")
        if count < 28 {
            //numberDisplay.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:2,length:1))
        } else {
            numberDisplay = NSMutableAttributedString(string:"\(count)")
        }
        numberDisplay.appendAttributedString(NSAttributedString(string: " sec"))
        
        timeDisplay.attributedText = numberDisplay
        
        if count == 0 {
            self.stopTimer()
        }
    }
    
    @IBAction func addTime(sender: AnyObject) {
        count += 10
        self.updateDisplay()
    }
}

