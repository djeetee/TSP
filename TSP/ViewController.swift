//
//  ViewController.swift
//  TSP
//
//  Created by djeetee on 2018-03-31.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GADelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        runIt()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func runIt() {
        let dnaCount = 20
        let popSize = 400
        let xOverRate = 0.5
        let mutationRate = 0.05
        let epochs = 4000
        let updateEvery = 40
        
        // no point in creating a population with a size < factorial(numberOfGenes)
        guard factorial(of: Double(dnaCount)) >= Double(popSize) else {
            print("The DNA count must be increased.")
            return
        }
        
        // grab dnaCount cities' data from the file
        let dm = DataManager(entries: dnaCount)
        let cities = dm.dataTable
    
        // init the GA
        let ga = GA(dna: cities,
                    withPopulationSize: popSize,
                    withCrossOver: xOverRate,
                    withMutation: mutationRate)
        
        // for callback
        ga?.delegate = self
        
        // run it and update us
        ga?.run(epochs: epochs, updateEvery: updateEvery)
        
        print("All Done!")
    }
    
    
    
    func update(didFinishEpoch: Int, topParents: (Tour, Tour)) {
        let adam = topParents.0
        let eve = topParents.1
        print("Epoch: \(didFinishEpoch)")
        print("ADAM: \(adam.description())")
        print("EVE: \(eve.description())")
    }

}

