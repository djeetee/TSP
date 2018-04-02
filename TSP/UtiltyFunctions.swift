//
//  UtiltyFunctions.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

func shuffleArray<T>(array: [T]) -> [T] {
    var arrayToShuffle = array
    var shuffled = [T]();
    
    for _ in 0..<arrayToShuffle.count
    {
        let randPos = Int(arc4random_uniform(UInt32(arrayToShuffle.count)))
        shuffled.append(arrayToShuffle[randPos])
        
        arrayToShuffle.remove(at: randPos)
    }
    
    return shuffled
}

