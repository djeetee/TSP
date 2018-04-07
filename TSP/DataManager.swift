//
//  DataManager.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

fileprivate let dataFileName = "WorldCities-CA"
fileprivate let dataFileExt = "csv"

class DataManager {
    var dataTable = [City]()

    
    init(entries: Int) {
        dataTable = readDataset(entries: entries)
    }
    
    
    func readDataset(entries: Int) -> [City] {
        var pickedCities = [City]()
        
        
        let rawDataset = readDataFile() 
        let fullDataset = convertFromCSV(data: rawDataset!)
        
        // let's randomly pick the required number of cities
        var randNumArray = [Int]()
        var index: Int
        
        // first build an arrays of unique indices
        for i in 0..<entries {
            while true {
                index = Int(arc4random_uniform(UInt32(fullDataset.count)))
                if !randNumArray.contains(index) {
                    randNumArray.insert(index, at: i)
                    break
                }
            }
        }
        
        // now from the entire dataset, return just the elements based on the random indices
        for i in randNumArray {
            pickedCities.append(fullDataset[i])
        }
        
        return pickedCities
    }
    
    
    func readDataFile()-> String? {

        guard let filepath = Bundle.main.path(forResource: dataFileName, ofType: dataFileExt)
            else { return nil }
    
        do {
            let rawContent = try String(contentsOfFile: filepath, encoding: .utf8)
            return rawContent
        } catch {
            return nil
        }
    }
    
    func convertFromCSV(data: String) -> [City] {
        var result = [City]()
        
        let fileContent = cleanRawData(file: data)
        
        let rows = fileContent.components(separatedBy: "\n")
        
        for row in rows {
            guard row.count > 1 else { break }
            
            let columns = row.components(separatedBy: ",")

            let city = City(cityName: columns[0],
                            cityLatitude: Double(columns[1])!,
                            cityLongitude: Double(columns[2])!)
             
            result.append(city)
        }
        return result
    }
    
    
    func cleanRawData(file: String) -> String {
        var cleanFile = file
        
        cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
        cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
        
        return cleanFile
    }
    
    
}
