//
//  HarryPotterModel.swift
//  HarryPotter_API
//
//  Created by julia rodriguez on 6/26/19.
//  Copyright © 2019 julia rodriguez. All rights reserved.
//

import Foundation

struct TopLevelDict: Decodable {
    
let name: String
let role: String
let house: String
let school: String
let ministryOfMagic: Bool
let orderOfThePhoenix: Bool
let dumbledoresArmy: Bool
let deathEater: Bool
let bloodStatus: String
let species: String
    
}
