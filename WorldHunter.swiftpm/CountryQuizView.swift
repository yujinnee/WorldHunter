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
    
//    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Find Treasure!")
                .font(.largeTitle)
            Text("Neighbor : Cuba, Jamaica, Dominican republic")
                .font(.title)
            ZStack{
//                Image("map")
//                    .resizable()
//                    .frame(width:700, height:500)//프레임
                ZoomableImageView(image: UIImage(named:("Asia")) ?? UIImage())
                    .frame(width:700, height:500)//프레임
//                ZStack {
//                    Rectangle()
//                    Circle()
//                        .frame(width: 200, height: 200)
//                        .offset(x: self.currentPosition.width, y: self.currentPosition.height)
//                        .gesture(DragGesture()
//                            .onChanged { value in
//                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
//                            }
//                            .onEnded { value in
//                                self.currentPosition = CGSize(width: value.translation.width + self.newPosition.width, height: value.translation.height + self.newPosition.height)
//                                self.newPosition = self.currentPosition
//                            })
////                        .gesture(
////                                            MagnificationGesture()
////                                                .onChanged { value in
////                                                    self.scale = value.magnitude
////                                                    print("Di")
////                                                }
////                                        )
//
//                        .blendMode(.destinationOut)
//                }
                .frame(width:700, height:500)//프레임
                .compositingGroup()
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
