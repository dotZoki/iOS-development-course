//
//  ViewController.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var taskPriority: UIPickerView!
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var report: UILabel!
    @IBOutlet weak var lastTask: UILabel!
    
    var pickerDataSource = DTTaskPriority.allValues
    
    lazy var taskManager: DTTaskManager = {
        if let storedTaskManager = NSUserDefaults.standardUserDefaults().objectForKey("TaskManager") {
            return storedTaskManager as! DTTaskManager
        } else {
            return DTTaskManager.instance
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.taskPriority.dataSource = self
        self.taskPriority.delegate = self
        
        if let storedTaskManager = NSUserDefaults.standardUserDefaults().objectForKey("TaskManager") {
            self.taskManager = storedTaskManager as! DTTaskManager
        }
        
        // Should I save current taskManager to user storage here?
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return String(pickerDataSource[row])
    }
    
    @IBAction func saveTask(sender: UIButton) {
        let task: DTTask = DTTask(name: taskName.text!)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        
        report.text = String(taskManager.addTask(task))
        
        lastTask.text = task.name + " " + formatter.stringFromDate(task.created)
        
        NSUserDefaults.standardUserDefaults().setObject(taskManager, forKey: "TaskManager")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}

