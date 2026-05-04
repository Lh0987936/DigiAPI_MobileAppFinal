//
//  DeveloperModel.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 5/1/26.
//

import Foundation
enum Developer: String, CaseIterable{
    case LoganHoover
    var Age: Int {
        return 2026 - BirthYear
    }

    var photo: String {
        switch self {
        case .LoganHoover: return "SelfPic"
        }
    }

    var BirthYear: Int {
        switch self {
        case .LoganHoover: return 2005
        }
    }
    
    var Name: String {
        switch self {
        case .LoganHoover: return "Logan Hoover"
        }
    }
    var Greeting: String {
        switch self {
        case .LoganHoover: return "Hello! I'm Logan Hoover and I made the app your looking at now! I've Loved digimon since I was little and have had a real resurgance in my enjoyment for them, so when presented with the opportunity, decided to make a Digimon finder rather than the standard PokeApi Pokedex!"
        }
    }
}
