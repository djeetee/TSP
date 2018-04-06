//
//  GA.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation


class GA {
    var citizen0, citizen1: Tour    // the original sinners :)
    var popSize: Int                // how many indivuduals the pop will hold
    var crossoverRate: Double       //
    var mutationRate: Double
    
    var delegate: GADelegate?   // the parent caller which will handle the display of GA's progress
    
    
    init?(withCitizen0 citizen0: Tour,
         andCitizen1 citizen1: Tour,
         withPopulationSize popSize: Int = 100,
         withCrossOver crossoverRate: Double = 0.50,
         withMutation mutationRate: Double = 0.10) {
        
        // no point in creating a population with a size < factorial(numberOfGenes)
        guard factorial(of: citizen0.size()) >= popSize else { return nil }
        
        // safety valve
        guard citizen0.size() == citizen1.size() else { return nil }
        
        // set the member variables
        self.citizen0 = citizen0
        self.citizen1 = citizen1
        self.popSize = popSize
        self.crossoverRate = crossoverRate
        self.mutationRate = mutationRate
    }
    
    func run(epochs: Int = 100, updateEvery: Int = 5) {
        var parentA, parentB: Tour
        
        // Starting with the proverbial adam and eve (citizen0 and citizen1)
        (parentA, parentB) = (citizen0, citizen1)
        
        // run the algorithm and poke the caller every now and then (updateEvery)
        for epochNumber in 0..<epochs {
            // create a new population from these parents
            let pop = Population(fromParentA: parentA,
                             andParentB: parentB,
                             andSize: popSize,
                             withCrossOver: crossoverRate,
                             withMutation: mutationRate)
            
            guard pop != nil else { break }
            
            // get the best two performing parents
            (parentA, parentB) = pop!.getTopPerformers()
            
            // print their details
            print(parentA.description())
            print(parentB.description())
            
            if epochNumber % updateEvery == 0 {
                // uddate the controller
                if let del = delegate { // make sure the delegate property was set
                    del.update(didFinishEpoch: epochNumber,
                                   topParents: (parentA, parentB))
                }
            }
        }   // next epoch
    }
    
}
