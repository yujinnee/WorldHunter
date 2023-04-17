//
//  Country.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/18.
//

import Foundation

struct Country: Identifiable, Decodable{
    var id: Int
    var name: String
    var neighbors: [String]
    
    var continent: Continent
    
    enum Continent: String, CaseIterable, Codable{
        case asia = "Asia"
        case africa = "Africa"
        case europe = "Europe"
        case southAmerica = "South America"
        case northAmerica = "North America"
        case oceaia = "Oceania"
        
    }
}
