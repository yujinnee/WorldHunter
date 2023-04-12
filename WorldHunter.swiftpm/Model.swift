//
//  Model.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import Foundation

final class ModelData: ObservableObject {
    var continents = ["Asia","North America","South America","Africa","Oceania","Europe"]
    var countries = [Country(name: "Korea", neighbors: ["Japan","China","Russia"]),
                     Country(name: "USA", neighbors: ["Canada","Mexico"])]
    
}

struct Country{
    let name: String
    let neighbors: [String]
}
