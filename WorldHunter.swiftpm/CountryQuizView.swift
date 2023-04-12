//
//  FindWorldView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI

struct CountryQuizView: View {
    var continent: String
    var body: some View {
        Text("Quiz")
    }
}

struct CountryQuizView_Previews: PreviewProvider {
    static var previews: some View {
        CountryQuizView(continent: ModelData().continents[0])
    }
}
