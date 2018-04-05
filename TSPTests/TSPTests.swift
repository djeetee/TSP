//
//  TSPTests.swift
//  TSPTests
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import XCTest
@testable import TSP

class TSPTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGAInit() {
        let cityA = City(cityName: "Toronto", cityLongitude: 43.645471, citylatitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLongitude: 52.636372, citylatitude: -92.986532)
        let cityC = City(cityName: "Vancouver", cityLongitude: 44.673527, citylatitude: 66.821027)
        
        var cities = [City]()
        cities.append(cityA)
        cities.append(cityB)
        cities.append(cityC)
        
        let tour1 = Tour(withCities: cities)
        
        let ga = GA(withCitizen0: tour1, andCitizen1: tour1, withPopulationSize: 6, withCrossOver: 0.5, withMutation: 0.1)
        
        XCTAssert(ga != nil, "GA returned nil")
        
        cities.remove(at: 0)
        let tour2 = Tour(withCities: cities)
        let ga1 = GA(withCitizen0: tour1, andCitizen1: tour2, withPopulationSize: 6, withCrossOver: 0.5, withMutation: 0.1)

        XCTAssert(ga1 != nil, "GA returned nil")
    }
    
    func testCityInit() {
        let cityName = "Toronto"
        let cityLong = 43.645471
        let cityLat = -79.380567
        
        let city = City(cityName: cityName, cityLongitude: cityLong, citylatitude: cityLat)
        XCTAssertTrue(city.name == cityName, "City Name is \(city.description())")
    }
    
    func testCalculateDistance() {
        let cityA = City(cityName: "Toronto", cityLongitude: 43.645471, citylatitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLongitude: 52.636372, citylatitude: -92.986532)

        let longDistance = abs(cityA.longitude - cityB.longitude)
        let latDistance = abs(cityA.latitude - cityB.latitude)
        
        let distance = sqrt( (longDistance * longDistance) + (latDistance * latDistance) )

        XCTAssert(cityA.distanceTo(city: cityB) == distance, "cityA.distance = \(cityA.distanceTo(city: cityB)), distance = \(distance)")
    }
    
    
    func testTourInit() {
        let cityA = City(cityName: "Toronto", cityLongitude: 43.645471, citylatitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLongitude: 52.636372, citylatitude: -92.986532)
        let cityC = City(cityName: "Vancouver", cityLongitude: 44.673527, citylatitude: 66.821027)
        
        var cities = [City]()
        cities.append(cityA)
        cities.append(cityB)
        cities.append(cityC)
        XCTAssertTrue(cities.count == 4, "cities has \(cities[0].name + ", " + cities[1].name + ", " + cities[2].name)")
        
        let tour = Tour(withCities: cities)
        XCTAssertTrue(tour.size() == 4, "Tour has \(tour.size()) cities and they are \(tour.description())")
        
    }
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
