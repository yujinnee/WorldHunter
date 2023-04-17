//
//  Model.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import Foundation
import Combine

final class ModelData: ObservableObject,Identifiable {
    @Published var countries: [Country] = load("Countries.json")
//    var continents = ["Asia","North America","South America","Africa","Oceania","Europe"]
    
    var continents: [String: [Country]]{
        Dictionary(
            grouping: countries, by: {$0.continent.rawValue})
    }

}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


