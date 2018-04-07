//
//  DataManager.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

fileprivate let dataFileURL = "http://localhost/TSP/WorldCities-CA.csv"


class DataManager {
    var dataTable = [City]()

    
    init(entries: Int) {
        dataTable = readDataset(entries: entries)
    }
    
    
    func readDataset(entries: Int) -> [City] {
        var pickedCities = [City]()
        
        
        let rawDataset = readFileFromURL(stringURL: dataFileURL)
        let fullDataset = convertFromCSV(data: rawDataset!)
        
        // let's randomly pick the required number of cities
        var randNumArray = [Int]()
        var index: Int
        
        // first build an arrays of unique indices
        for i in 0..<entries {
            while true {
                index = Int(arc4random_uniform(UInt32(dataTable.count)))
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
    
    
    func readFileFromURL(stringURL: String)-> String? {
        if let url = NSURL(string: stringURL) {
            do {
                return try String(contentsOf: url as URL, encoding: .utf8)
            } catch {
                print("Error loading remote file")
                return nil
            }
        } else {
            print("Invalid string URL")
            return nil
        }
        
    }
    
    func convertFromCSV(data: String) -> [City] {
        var result = [City]()
        
        let fileContent = cleanRawData(file: data)
        
        print(fileContent)
        
        let rows = fileContent.components(separatedBy: "\n")
        print(rows[0])
        
        for row in rows {
            guard row.count > 1 else { break }
            
            let columns = row.components(separatedBy: ",")
            print(columns.count)

            let city = City(cityName: columns[1],
                            cityLatitude: Double(columns[2])!,
                            cityLongitude: Double(columns[3])!)
             
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
