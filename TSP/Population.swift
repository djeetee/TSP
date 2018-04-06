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
    init?(fromParentA adam: Tour,
         andParentB eve: Tour,
         andSize size: Int,
         withCrossOver xOver: Double,
         withMutation mutation: Double) {
        
        guard adam.size() == eve.size() else { return nil }
        
        self.popCount = size
        
        // creates child Tours and builds the population
        for _ in 0..<size {
            if let childTour = makeChildTour(fromParentA: adam,
                                             andParentB: eve,
                                             withCrossOver: xOver,
                                             withMutation: mutation) {
                cityTours.append(childTour)
            }
        }
    }
    
    // from two parents, create a child applying the crossover and mutation rates
    // each parent is a Tour
    func makeChildTour(fromParentA adam: Tour,
                           andParentB eve: Tour,
                           withCrossOver xOver: Double,
                           withMutation mutation: Double) -> Tour? {
        
        guard adam.size() == eve.size() else { return nil }
        
        // prepare a placeholder for the child's genes
        var emptyChildCityArray = [City?](repeating: nil, count: adam.size())
        
        // placeholder for the xover genes
        var xOverGenes = [City]()
        
        // number of genes to inherit from adam or eve
        let numOfCrossoverGenes = Int(xOver * Double(adam.size()))
        
        // number of mutations to execute
        let numOfMutations = Int(mutation * Double(adam.size()))
        
        // get the starting point of the crossover genes bundle
        let start = Int(arc4random_uniform(UInt32(adam.size() - numOfCrossoverGenes + 1)))
        
        // grab the crossover genes bundle from either adam or eve
        // we're tossing a coing and picking adam if we get 0, eve if we get 1
        let (xOverParent, otherParent) = arc4random_uniform(2) == 0 ? (adam, eve) : (eve, adam)
        
        // copy the xover genes to the exact positions in the child's genome
        for i in start..<start+numOfCrossoverGenes {
            emptyChildCityArray[i] = xOverParent.cities[i]
            xOverGenes.append(xOverParent.cities[i])
        }
        
        // save the names of the cities to conserve some cpu cycles later on
        let xOverGenesIDs = xOverGenes.map({ $0.name })
        
        // transfer the remaining genes (avoiding duplicates) from the other parent
        
        // used to track the j position in the otherParent and avoid rescanning
        // the otherParent's gene from index 0 whic will lead to dulicates in the
        // child's genome
        var lastPos: Int = 0
      
        // step 1: copy the before xover genes
        for i in 0..<start {
            for j in lastPos..<otherParent.size() {
                if !xOverGenesIDs.contains(otherParent.cities[j].name) {
                    emptyChildCityArray[i] = otherParent.cities[j]
                    lastPos = j + 1
                    break
                }
            }
        }
        
        // step 2: copy the after xover genes
        for i in start+numOfCrossoverGenes..<otherParent.size() {
            for j in lastPos..<otherParent.size() {
                if !xOverGenesIDs.contains(otherParent.cities[j].name) {
                    emptyChildCityArray[i] = otherParent.cities[j]
                    lastPos = j + 1
                    break
                }
            }
        }
        
        
        // TODO: ----------
        // mutate (swap) genes based on the number of mutations

        
        // the child is born!
        let child = Tour(withCities: emptyChildCityArray as! [City])
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
            desc += tour.description() + "\r\n"
        }
        return desc
    }
    
    // returns the population size
    func size() -> Int {
        return popCount
    }
    
}
