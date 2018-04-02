//
//  GA.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

class GA {
    var population: Population?
    var citizen0, citizen1: [City]
    var popSize: Int
    var crossoverRate: Double
    var mutationRate: Double
    
    
    init(withCitizen0 citizen0: [City],
         andCitizen1 citizen1: [City],
         withPopulationSize popSize: Int = 100,
         withCrossOver crossoverRate: Double = 0.50,
         withMutation mutationRate: Double = 0.10) {
        
        self.citizen0 = citizen0
        self.citizen1 = citizen1
        self.popSize = popSize
        self.crossoverRate = crossoverRate
        self.mutationRate = mutationRate
    }
    
    func run(epochs: Int = 100, updateEvery: Int = 10) {
 
        // create the first population
        var pop = Population(fromParentA: citizen0,
                             andParentB: citizen1,
                             andSize: popSize,
                             withCrossOver: crossoverRate,
                             withMutation: mutationRate)
        
        var parentA, parentB: Tour
        
        for _ in 0..<epochs {
            // get the best two performing parents
            (parentA, parentB) = pop.getTopPerformers()
            
            // print their details
            print(parentA)
            print(parentB)
            
            // create a new population from these parents
            // pop = Population()
            
            // add a new init to Population passing the 2 best parents
            // from the previous population instead of regenerate()?
            if epochs % updateEvery == 0 {
                // uddate the display
                
            }
            // next epoch
        }

    }
    

    
}
