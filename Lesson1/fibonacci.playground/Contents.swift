//: Playground - noun: a place where people can play

import UIKit

// 1 1 2 3 5 8 13 21 34 55 89 144

// There are no valid number checks for functions input

func fibonacciLoop(which: Int16) {
    var f1 = 0, f2 = 1, number = 0
    for _ in 1...which {
        number = f1 + f2
        f2 = f1
        f1 = number
        //print("\(number)");
    }
    
    print("\(number)");
}

func fibonacciRecursive(which: Int16) -> Int {
    if which == 1 || which == 2 {
        return 1
    }
    
    return fibonacciRecursive(which - 2) + fibonacciRecursive(which - 1)
}

fibonacciLoop(10)
print(fibonacciRecursive(10))
