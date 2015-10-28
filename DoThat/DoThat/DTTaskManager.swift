//
//  DTTaskManager.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

class DTTaskManager {
    
    static let instance = DTTaskManager()
    
    private init() {
        
    }
    
    lazy var tasks : [DTTask] = self.load()
    
    func addTask(task: DTTask) -> Int {
        tasks.append(task)
        
        return tasks.count
    }
    
    func deleteTask(task: DTTask) {
        tasks = tasks.filter() { $0 !== task } // didnt test it yet
    }
    
    private func serialize() -> [AnyObject] {
        var serializedTasks = [AnyObject]()
        
        for task in tasks {
            serializedTasks.append(task.toDictionary())
        }
        
        return serializedTasks
    }
    
    func save() {
        NSUserDefaults.standardUserDefaults().setObject(self.serialize(), forKey: "Tasks")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func load() -> [DTTask] {
        var tasks = [DTTask]()
        let serializedTasks = NSUserDefaults.standardUserDefaults().objectForKey("Tasks")
        
        if let serializedTasks = serializedTasks as? [[String : AnyObject]] {
            for task in serializedTasks {
                let task = DTTask(dictionary: task)
                tasks.append(task)
            }
        }
        
        return tasks
    }
}