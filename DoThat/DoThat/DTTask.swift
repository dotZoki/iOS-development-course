//
//  DTTask.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

class DTTask {
    var name: String {
        didSet {
            changed = NSDate()
        }
    }
    
    var priority: DTTaskPriority {
        didSet {
            changed = NSDate()
        }
    }
    var state: DTTaskState {
        didSet {
            changed = NSDate()
        }
    }
    
    var description: String? {
        didSet {
            changed = NSDate()
        }
    }
    
    
    var created: NSDate
    var changed: NSDate?
    
    init(name: String, priority: TaskPriority, state: TaskState) {
        self.name = name
        self.priority = priority
        self.state = state
        
        created = NSDate()
    }
    
    convenience init(name: String) {
        self.init(name: name, priority: TaskPriority.Medium, state: TaskState.Open)
    }
    
    convenience init(name: String, priority: TaskPriority) {
        self.init(name: name, priority: priority, state: TaskState.Open)
    }
    
    func setDescription(description: String) {
        self.description = description
    }
    
}