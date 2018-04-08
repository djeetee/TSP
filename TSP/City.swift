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
    
    init(cityName: String, cityLatitude: Double, cityLongitude: Double) {
        name = cityName
        latitude = cityLatitude
        longitude = cityLongitude
    }
    
    // distance is calculated using the haversine calculation
    // see: http://www.movable-type.co.uk/scripts/latlong.html
    
    // calculates the distance to a given city
    func distance(toCity: City) -> Double {
        let R: Double = 6371  // Radius of the earth in km
 
        let lat1, lat2, lon1, lon2: Double
        
        lat1 = toRadians(fromDeg: self.latitude)
        lon1 = toRadians(fromDeg: self.longitude)
        
        lat2 = toRadians(fromDeg: toCity.latitude)
        lon2 = toRadians(fromDeg: toCity.longitude)
        
        let dLat = lat2 - lat1
        let dLon = lon2 - lon1
        
        let a =
            sin(dLat / 2) * sin(dLat / 2) +
                cos(lat1) * cos(lat2) *
                sin(dLon / 2) * sin(dLon / 2)
        
        let c = 2 * atan2(sqrt(a), sqrt(1 - a))
        let d = R * c   // distance in km
        
        return d
    }

    
    // returns city description and its coordinates
    func description() -> String {
        let desc = "\(name): (\(latitude),\(longitude))"
        return desc
    }
    
    private func toRadians(fromDeg: Double) -> Double {
        return fromDeg * (Double.pi / 180)
    }

    
}
