//
//  DTTask.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

class DTTask : Equatable {
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
    
    init(name: String, priority: DTTaskPriority, state: DTTaskState) {
        self.name = name
        self.priority = priority
        self.state = state
        
        created = NSDate()
    }
    
    convenience init(name: String) {
        self.init(name: name, priority: DTTaskPriority.Medium, state: DTTaskState.Open)
    }
    
    convenience init(name: String, priority: DTTaskPriority) {
        self.init(name: name, priority: priority, state: DTTaskState.Open)
    }
    
    func setDescription(description: String) {
        self.description = description
    }
}

func ==(lhs: DTTask, rhs: DTTask) -> Bool {
    return lhs.name == rhs.name && lhs.created == rhs.created
}