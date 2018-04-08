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
    
    
    func testDataManager() {
        let dm = DataManager(entries: 20)
        
        let cities = dm.dataTable
        
        
        XCTAssert(cities.count == 20, "Dataset is not 20 elements long.")
        
        let parentA = Tour(withCities: cities)
        let parentB = Tour(withCities: cities)
        
        let pop = Population(fromParentA: parentA, andParentB: parentB, andSize: 100, withCrossOver: 0.5, withMutation: 0.1)
        
        XCTAssert(pop != nil, "pop is nil")
        
        XCTAssert(pop?.size() == 100, "pop size is not 25")

    }
    
    func testPopulation() {
        let cityA = City(cityName: "Toronto", cityLatitude: -79.380567, cityLongitude: 43.645471 )
        let cityB = City(cityName: "Montreal", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityC = City(cityName: "Vancouver", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityD = City(cityName: "Sydney", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityE = City(cityName: "Tokyo", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityF = City(cityName: "Hong Kong", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityG = City(cityName: "Beirut", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityH = City(cityName: "Paris", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityI = City(cityName: "Madrid", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityJ = City(cityName: "Bordeaux", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityK = City(cityName: "Munich", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityL = City(cityName: "London", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityM = City(cityName: "New York", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityN = City(cityName: "Boston", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityO = City(cityName: "Chicago", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityP = City(cityName: "Los Angeles", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityQ = City(cityName: "San Diego", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityR = City(cityName: "Las Vegas", cityLatitude: 44.673527, cityLongitude: 66.821027)
        let cityS = City(cityName: "Miami", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityT = City(cityName: "Seatle", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityU = City(cityName: "Austin", cityLatitude: 44.673527, cityLongitude: 66.821027)
        
        var citiesA = [City]()
        citiesA.append(cityA)
        citiesA.append(cityB)
        citiesA.append(cityC)
        citiesA.append(cityD)
        citiesA.append(cityE)
        citiesA.append(cityF)
        citiesA.append(cityG)
        citiesA.append(cityH)
        citiesA.append(cityI)
        citiesA.append(cityJ)
        citiesA.append(cityK)
        citiesA.append(cityL)
        citiesA.append(cityM)
        citiesA.append(cityN)
        citiesA.append(cityO)
        citiesA.append(cityP)
        citiesA.append(cityQ)
        citiesA.append(cityR)
        citiesA.append(cityS)
        citiesA.append(cityT)
        citiesA.append(cityU)
        
        let parentA = Tour(withCities: citiesA)
 
        var citiesB = [City]()
        citiesB.append(cityU)
        citiesB.append(cityT)
        citiesB.append(cityS)
        citiesB.append(cityR)
        citiesB.append(cityQ)
        citiesB.append(cityP)
        citiesB.append(cityO)
        citiesB.append(cityN)
        citiesB.append(cityM)
        citiesB.append(cityL)
        citiesB.append(cityK)
        citiesB.append(cityJ)
        citiesB.append(cityI)
        citiesB.append(cityH)
        citiesB.append(cityG)
        citiesB.append(cityF)
        citiesB.append(cityE)
        citiesB.append(cityD)
        citiesB.append(cityC)
        citiesB.append(cityB)
        citiesB.append(cityA)
        
        let parentB = Tour(withCities: citiesB)
        
        let pop = Population(fromParentA: parentA, andParentB: parentB, andSize: 25, withCrossOver: 0.5, withMutation: 0.1)
        
        XCTAssert(pop != nil, "pop is nil")
        
        XCTAssert(pop?.size() == 25, "pop size is not 25")
        
    }
    
    
    func testGAInit() {
        let cityA = City(cityName: "Toronto", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityC = City(cityName: "Vancouver", cityLatitude: 44.673527, cityLongitude: 66.821027)
        
        var cities = [City]()
        cities.append(cityA)
        cities.append(cityB)
        cities.append(cityC)
        
        let tour1 = Tour(withCities: cities)
        
        let ga = GA(withCitizen0: tour1, andCitizen1: tour1, withPopulationSize: 6, withCrossOver: 0.5, withMutation: 0.1)
        
        XCTAssert(ga != nil, "GA returned nil")
        
        //cities.remove(at: 0)
        let tour2 = Tour(withCities: cities)
        let ga1 = GA(withCitizen0: tour1, andCitizen1: tour2, withPopulationSize: 6, withCrossOver: 0.5, withMutation: 0.1)

        XCTAssert(ga1 != nil, "GA returned nil")
    }
    
    func testCityInit() {
        let cityName = "Toronto"
        let cityLong = 43.645471
        let cityLat = -79.380567
        
        let city = City(cityName: cityName, cityLatitude: cityLong, cityLongitude: cityLat)
        XCTAssert(city.name == cityName, "City Name is \(city.description())")
    }
    
    func testCalculateDistance() {
        let cityA = City(cityName: "Toronto", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLatitude: 52.636372, cityLongitude: -92.986532)

        let longDistance = abs(cityA.longitude - cityB.longitude)
        let latDistance = abs(cityA.latitude - cityB.latitude)
        
        let distance = sqrt( (longDistance * longDistance) + (latDistance * latDistance) )

        XCTAssert(cityA.distance(toCity: cityB) == distance, "cityA.distance = \(cityA.distance(toCity: cityB)), distance = \(distance)")
    }
    
    
    func testTourInit() {
        let cityA = City(cityName: "Toronto", cityLatitude: 43.645471, cityLongitude: -79.380567)
        let cityB = City(cityName: "Montreal", cityLatitude: 52.636372, cityLongitude: -92.986532)
        let cityC = City(cityName: "Vancouver", cityLatitude: 44.673527, cityLongitude: 66.821027)
        
        var cities = [City]()
        cities.append(cityA)
        cities.append(cityB)
        cities.append(cityC)
        XCTAssert(cities.count == 3, "cities has \(cities[0].name + ", " + cities[1].name + ", " + cities[2].name)")
        
        let tour = Tour(withCities: cities)
        XCTAssert(tour.size() == 3, "Tour has \(tour.size()) cities and they are \(tour.description())")
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
