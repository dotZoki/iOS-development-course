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
    var changed: NSDate? = nil
    
    init(name: String, priority: DTTaskPriority, state: DTTaskState) {
        self.name = name
        self.priority = priority
        self.state = state
        
        created = NSDate()
        //changed = NSDate()
    }
    
    init (dictionary: [String : AnyObject]) {
        self.name = dictionary["name"] as! String
        self.priority = DTTaskPriority(rawValue: (dictionary["priority"] as! String))!
        self.created = dictionary["created"] as! NSDate
        self.changed = dictionary["changed"] as! NSDate
        self.state = DTTaskState(rawValue: (dictionary["state"] as! String))!
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
    
    func toDictionary () -> [String : AnyObject] {
        return ["name" : self.name, "created" : self.created, "changed" : self.changed!, "priority" : self.priority.rawValue, "state" : self.state.rawValue ]
    }
}

func ==(lhs: DTTask, rhs: DTTask) -> Bool {
    return lhs.name == rhs.name && lhs.created == rhs.created
}