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
    @State private var match = false
    
    @State var shouldNavigate = false
    @State var showAlert = false
    
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    
    @Binding var isNavigationLinkActive: Bool
    
    @State var quizCountry: Country
    
    @State var selectedElements: [String] = []
    
    init(continentName: String,countries: [Country],isNavigationLinkActive: Binding<Bool>) {
        self.continentName = continentName
        self.countries = countries
        _isNavigationLinkActive = isNavigationLinkActive
        var randomIndex = Int.random(in: 0..<countries.count)
        quizCountry = countries[randomIndex]
        
        
    }
    
    
    var body: some View {
        
        VStack{
            Text(continentName)
                .font(.system(size: 60))
            Text(quizCountry.name)
            Spacer()
                .frame(height: 10)
            Text("You have obtained the location information of the treasure.")
                .font(.system(size: 20))
            Text("The country where the treasure is hidden is located in the center of ")
                .font(.system(size: 20))
            Spacer()
                .frame(height: 10)
            HStack{
                ForEach(quizCountry.neighbors) { neighbor in
                    Text(neighbor)
                    Text("       ")
                }
            }
            .font(.system(size: 30))
            
            HStack{
                VStack{
                    ZStack{
                        ZoomableImageView(image: UIImage(named:(continentName)) ?? UIImage())
                            .frame(width:600, height:400)//프레임
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
                    Text("Use a magnifying glass to find out the country where the treasure is hidden")
                        .font(.system(size: 25))
                }
                
                VStack{
                    ForEach(selectedElements) { country in
                        if shouldNavigate {
                            NavigationLink(destination: TreasureView(), isActive: $shouldNavigate) {
                                EmptyView()
                            }
                        } else {
                            Button {
                                if country == quizCountry.name { // 조건이 참일 때
                                    shouldNavigate = true
                                } else { // 조건이 거짓일 때
                                    showAlert = true
                                }
                                
                            }label: {
                                ZStack{
                                    Image("Button")
                                        .resizable()
                                        .frame(width:150,height: 50)
                                    Text(country)
                                        .font(.system(size: CGFloat(180/country.count)))
                                        .foregroundColor(.white)
                                }
                                
                            }
                            .alert(isPresented: $showAlert) {
//                                Button("Try Again", role: .cancel){showing = false}
                                Alert(title: Text("No Treasure"), message: Text("Find Again"), dismissButton: .default(Text("OK")))
                            }
                        }
                        
                    }
                }
                
            }
            
            
        }
        .onAppear {
            self.isNavigationLinkActive = true
            var randomIndex = Int.random(in: 0..<countries.count)
            quizCountry = countries[randomIndex]
            
            var array = countries.map{$0.name}.filter{$0 != quizCountry.name && !quizCountry.neighbors.contains($0)}.shuffled().prefix(4).sorted()
            lazy var answerIndex = Int.random(in: 0..<array.count)
            array[answerIndex] = quizCountry.name
            selectedElements = array
        }
    }
    
}
//struct CountryQuizView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryQuizView(continentName: "Asia", countries: ModelData().countries,isNavigationLinkActive: )
//    }
//}
