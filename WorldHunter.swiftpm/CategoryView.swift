//
//  CategoryView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI
extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct CategoryView: View {
    var items = ModelData().continents
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0) {
                ForEach(items) { continent in
                    NavigationLink {
                        CountryQuizView(continent: continent)
                    } label: {
                        Label(continent, systemImage: "chevron.right.circle")
                            .font(.headline)
                            .padding(.leading,15)
                            .padding(.top, 5)
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
        .frame(height: 185)
       
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(items: ModelData().continents)
    }
}
