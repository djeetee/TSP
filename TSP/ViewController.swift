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
    
        let dm = DataManager(entries: 20)
        let cities = dm.dataTable
    
        let parentA = Tour(withCities: cities)
        let parentB = Tour(withCities: cities)
    
        let ga = GA(withCitizen0: parentA,
                    andCitizen1: parentB,
                    withPopulationSize: 100,
                    withCrossOver: 0.5,
                    withMutation: 0.1)
        
        ga?.delegate = self
        
        ga?.run()
    }
    
    func update(didFinishEpoch: Int, topParents: (Tour, Tour)) {
        let adam = topParents.0
        let eve = topParents.1
        
        print("ADAM: \(adam.description())")
        print("EVE: \(eve.description())")
    }

}

