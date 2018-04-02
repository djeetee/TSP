//
//  Population.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

class Population {
    var cityTours = [Tour]()
    var popCount: Int = 0
    
    
    // builds a population from 2 parents
    init(fromParentA adam: Tour,
         andParentB eve: Tour,
         andSize size: Int,
         withCrossOver xOver: Double,
         withMutation mutation: Double) {
        
        if adam.size() == eve.size() {
            self.popCount = size
            
            // creates child Tours and builds the population
            for _ in 0..<size {
                cityTours.append(makeChildTourFrom(fromParentA: adam,
                                                   andParentB: eve,
                                                   withCrossOver: xOver,
                                                   withMutation: mutation))
            }
        }
    }
    
    // from two parents, create a child applying the crossover and mutation rates
    // each parent is an array of cities
    func makeChildTourFrom(fromParentA adam: Tour,
                           andParentB eve: Tour,
                           withCrossOver xOver: Double,
                           withMutation mutation: Double) -> Tour {
        var child: Tour
        
        // number of genes to inherit from adam or eve
        let numOfCrossoverGenes = Int(xOver * Double(adam.size()))
        
        // number of mutations to execute
        let numOfMutations = Int(mutation * Double(adam.size()))
        
        // get the starting point of the crossover genes bundle
        let start = Int(arc4random_uniform(UInt32(adam.size() - numOfCrossoverGenes)))
        
        // grab the crossover genes bundle from either adam or eve
        
        // transfer the remaining genes (avoiding duplicates) from the other parent
        
        // mutate (swap) genes based on the number of mutations
        
        // the child is born!
        
        return child
    }
    
    
    // returns the 2 cadidate parents for the next generation
    func getTopPerformers() -> (Tour, Tour) {
        // sort the Tours in ascending order
        let sortedTours = cityTours.sorted(by: { $0.fitness > $1.fitness} )
        
        // return the 2 best performers
        return (sortedTours[0], sortedTours[1])
    }

    // returns all the members of the population
    func description() -> String {
        var desc = ""
        
        for tour in cityTours {
            desc += tour.description() + "\\r\\n"
        }
        return desc
    }
    
    // returns the population size
    func size() -> Int {
        return popCount
    }
    
}
