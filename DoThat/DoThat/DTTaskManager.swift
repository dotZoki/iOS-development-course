//
//  DTTaskManager.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

class DTTaskManager {
    var tasks = [DTTask]()
    
    func addTask(task: DTTask) -> Int {
        tasks.append(task)
        
        return tasks.count
    }
    
    func deleteTask() {
        
    }
}