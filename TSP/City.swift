//
//  City.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

class City {
    var name: String
    var longitude: Double
    var latitude: Double
    
    init(cityName: String, cityLongitude: Double, citylatitude: Double) {
        name = cityName
        longitude = cityLongitude
        latitude = citylatitude
    }
    
    // calculates the distance to a given city
    func distanceTo(city: City) -> Double {
        let longDistance = abs(longitude - city.longitude)
        let latDistance = abs(latitude - city.latitude)
        
        let distance = sqrt( (longDistance * longDistance) + (latDistance * latDistance) )
        
        return distance;
    }
    
    // returns city description and its coordinates
    func description() -> String {
        let desc = "\(name): \(longitude), \(latitude)"
        return desc
    }
    
}
