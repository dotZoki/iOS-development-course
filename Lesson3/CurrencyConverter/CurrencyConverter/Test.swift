//
//  Test.swift
//  CurrencyConverter
//
//  Created by Zoran Lazic on 22/10/15.
//  Copyright © 2015 Zoran Lazic. All rights reserved.
//

import Foundation

struct Kvadrat: Geometrija {
    var a: Double
    
    func ploscina() -> Double {
        return a * a
    }
    
    mutating func povecaj(faktor: Double) {
        a = a * faktor
    }
}
    
protocol Geometrija {
    func ploscina () -> Double
    
    mutating func povecaj (faktor:Double)
}