//
//  FindWorldView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI

struct CountryQuizView: View {
    var continentName: String
    var countries: [Country]

    
    @State private var showing = false
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(continentName)
                .font(.largeTitle)
            Text("asia")
            VStack{
                ForEach(countries[0].neighbors) { neighbor in
                    Text(neighbor)
                }
            }
           
                .font(.title)
            ZStack{
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
                ForEach(countries) { country in
                    Button(country.name) {
                        showing = true
                    }
                    .alert("Correct", isPresented: $showing) {
                        Button("OK", role: .cancel){showing = false}
                    }
                    
                }
            }
           
            
            
            
        }
        
        
    }
}
//
//struct CountryQuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryQuizView(continent: ModelData().continents[0])
//    }
//}
