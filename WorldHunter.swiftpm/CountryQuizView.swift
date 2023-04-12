//
//  FindWorldView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI

struct CountryQuizView: View {
    @State private var showing = false
    var continent: String
    var body: some View {
        VStack(alignment: .leading){
            Text("Find Treasure!")
                .font(.largeTitle)
            Text("Neighbor : Russia, China, Japan")
                .font(.title)
            Image("Asia")
                .resizable()
                .frame(width:700, height:500)//프레임
            HStack{
                Button("Korea") {
                        showing = true
                    }
                    .alert("Correct", isPresented: $showing) {
                        Button("OK", role: .cancel){showing = false}
                    }
                Button("India") {
                        showing = true
                    }
                    .alert("Miss", isPresented: $showing) {
                        Button("OK", role: .cancel){showing = false}
                    }
            }
            HStack{
                Button("Kazakhstan") {
                        showing = true
                    }
                    .alert("Miss", isPresented: $showing) {
                        Button("OK", role: .cancel){showing = false}
                    }
                Button("Mongolia") {
                        showing = true
                    }
                    .alert("Miss", isPresented: $showing) {
                        Button("OK", role: .cancel){showing = false}
                    }
            }
            
           
            
        }
       
        
    }
}

struct CountryQuizView_Previews: PreviewProvider {
    static var previews: some View {
        CountryQuizView(continent: ModelData().continents[0])
    }
}