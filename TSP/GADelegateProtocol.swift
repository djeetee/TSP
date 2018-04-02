//
//  GADelegateProtocol.swift
//  TSP
//
//  Created by djeetee on 2018-04-02.
//  Copyright © 2018 Crash Test Apps Inc. All rights reserved.
//

import Foundation

protocol GADelegate {
    func controller(didFinishEpoch: Int, topParents: (Tour, Tour))
}
