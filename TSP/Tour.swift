//
//  Tour.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

// defines a list of cities the TS will travel in sequential order

class Tour {
    // the cities that define the Tour
    var cities: [City]
    // total sequential distance between the cities in the Tour
    var fitness: Double
    
    
    // creates a Tour with a pre-shuffled array of cities
    // withCities: a shuffled array of cities
    // the fitness of every Tour is genrated at init time
    init(withCities: [City]) {
        // init the properties
        cities = withCities
        
        // calculates the fitness (total distance) of the Tour
        var totalFitness = 0.0
        for i in 0..<cities.count - 1 {
            totalFitness += cities[i].distance(toCity: cities[i+1])
        }
        fitness = totalFitness
    }
    
    // returns the full Tour details: cityName1 -- nn -->cityName2, ....
    // nn being the distance between consecutive cities
    func description() -> String {
        var tourDetails = ""
        
        for i in 0..<cities.count - 1 {
            if i == 0 { // first city?
                tourDetails += "Fitness = \(fitness) : \(cities[i].name) "
            }
            tourDetails += " -- \(cities[i].distance(toCity: cities[i+1])) --> \(cities[i+1].name) "
        }
        
        return tourDetails
    }

    // how many cities do we have in a Tour
    func size() -> Int {
        return cities.count
    }
    
}
