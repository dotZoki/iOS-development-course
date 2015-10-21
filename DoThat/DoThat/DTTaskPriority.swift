//
//  DTTaskPriority.swift
//  DoThat
//
//  Created by Zoran Lazic on 20/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

enum DTTaskPriority : String {
    case High = "high"
    case Medium = "medium"
    case Low = "low"
    
    static let allValues = [High, Medium, Low]
}