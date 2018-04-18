//
//  UtiltyFunctions.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

// Shuffles an array and retuns the shuffled version
func shuffleArray<T>(array: [T]) -> [T] {
    var arrayToShuffle = array
    var shuffled = [T]();
    
    for _ in 0..<arrayToShuffle.count
    {
        // pick a random position of an element
        let randPos = Int(arc4random_uniform(UInt32(arrayToShuffle.count)))
        
        // add it to the shuffled array
        shuffled.append(arrayToShuffle[randPos])
        // remove it from the source so that it doesn't get selected again
        arrayToShuffle.remove(at: randPos)
    }
    
    // all done
    return shuffled
}


// Calculates the fcatorial of a number
func factorial(of n: Double) -> Double {
    if n > 1 {
        return n * factorial(of: n - 1)
    }
    else {
        return n
    }
}

// Takes an array of FP values and returns the normalized values in an array
func normalizeArray<T: FloatingPoint>(arr: [T]) -> [T] {
    guard let min = arr.min(), let max = arr.max() else {
        return []
    }
    return arr.map({ ($0 - min) / (max - min) })
}
