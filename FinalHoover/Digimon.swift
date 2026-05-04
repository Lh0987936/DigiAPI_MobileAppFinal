//
//  Digimon.swift
//  FinalHoover
//
//  Created by HOOVER, LOGAN on 4/27/26.
//

import Foundation
//Stores the DigiFiles
struct DigiList: Decodable {
    let content: [DigiFile]
}

//Stores the Digimon data
struct DigiFile: Decodable, Identifiable {
    let id: Int
    let name: String
    let href: String
    let image: String
    var Digimon: Digimon? //Hopefully will be able to fill with the Digimon after Decoded
}

//Called from href in DigiList
struct Digimon: Decodable, Identifiable {
    //Traits pulled from the API
    let id: Int
    let name: String
    let fields: [Field]
    let releaseDate: String
    let descriptions: [Description]
    let images: [Pic]
    
    // Function designed to look for the language of each description, and return the index in the array for the English_US one.
    func findEn_US() -> Int {
        if self.descriptions.count > 0 {
            var count = 0
            for description in descriptions {
                if description.language == "en_us" {
                    return count
                }
                count = count + 1
            }
        }
        return -1
    }
}
//the Fields the digimon can be found in
struct Field: Decodable, Identifiable{
    let id: Int
    let field: String
    let image: String
}
//Description of the Digimon (We'll sort for en_us in language)
struct Description: Decodable {
    let origin: String
    let language: String
    let description: String
}

struct Pic: Decodable {
    let href: String
    let transparent: Bool
}
