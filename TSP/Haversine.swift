//
//  Haversine.swift
//  TSP
//
//  Created by djeetee on 2018-04-06.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation


func getDistance(lat1: Double, lon1: Double, lat2: Double, lon2: Double) -> Double {
    let R: Double = 6371  // Radius of the earth in km
    
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


func radians(fromDeg: Double) -> Double {
    return fromDeg * (Double.pi / 180)
}
