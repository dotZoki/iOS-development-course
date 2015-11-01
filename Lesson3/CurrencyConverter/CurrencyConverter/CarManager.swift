//
//  CarManager.swift
//  CurrencyConverter
//
//  Created by Zoran Lazic on 29/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

@objc protocol CarManagerDelegate {
    func turnOnEngine ()
    optional func turnOffEngine ()
    func drive ()
}

class Person : NSObject, CarManagerDelegate {
    func turnOnEngine () {}
    func turnOffEngine () {}
    func drive () {}
}

class CarManager {
    
    var delegate: CarManagerDelegate?
    
    func runCar() {
        if let delegate = delegate {
            delegate.turnOnEngine()
            
            for var i = 0; i < 10; i++ {
                delegate.drive()
            }
            
            delegate.turnOffEngine?()
        }
    }
}
