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
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Find Treasure!")
                .font(.largeTitle)
            Text("Neighbor : China, Japan")
                .font(.title)
            ZStack{
                ZStack {
                    Rectangle()
                    Circle()
                        .frame(width: 200, height: 200)
                        .offset(x: self.currentPosition.width, y: self.currentPosition.height)
                        .gesture(DragGesture()
                            .onChanged { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                            }
                            .onEnded { value in
                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
                                self.newPosition = self.currentPosition
                            })
                        .blendMode(.destinationOut)
                }
                .frame(width:700, height:500)//프레임
                .compositingGroup()
                ZoomableImageView(image: UIImage(named:("Europe")) ?? UIImage())
//                    .resizable()
                    .frame(width:700, height:500)//프레임
               
            }
            
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
