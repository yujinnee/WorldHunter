//
//  FindWorldView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI

struct FindWorldView: View {
    var continent: String
    var body: some View {
        Text("Quiz")
    }
}

struct FindWorldView_Previews: PreviewProvider {
    static var previews: some View {
        FindWorldView(continent: ModelData().continents[0])
    }
}
