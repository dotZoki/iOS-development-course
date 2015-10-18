//: Playground - noun: a place where people can play

import UIKit

enum TaskState {
    case Open
    case Closed
    case Rejected
}

enum TaskPriority {
    case High
    case Medium
    case Low
}

class Task {
    var name: String {
        didSet {
            changed = NSDate()
        }
    }

    var priority: TaskPriority {
        didSet {
            changed = NSDate()
        }
    }
    var state: TaskState {
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

var task1 = Task(name: "first task")
task1.changed
task1.setDescription("Description of the task")
task1.changed

var task2 = Task(name: "2nd task", priority: TaskPriority.High)
task2.state = TaskState.Rejected
task2.changed