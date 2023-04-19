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
    @State private var isAnimating = false
    
    @State private var scale: CGFloat = 1.0
    @State private var position: CGSize = .zero
    
    
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
        
        HStack{
            
            VStack{
                Text(continentName)
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 1.0).delay(0), value: isAnimating)
                
                ZoomableImageView(image: UIImage(named:(continentName)) ?? UIImage())
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 1.0).delay(0), value: isAnimating)

                Text("You can zoom in and out the map using two fingers. And you can drag it with one finger to move the map.")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 2.0).delay(7.0), value: isAnimating)

                
            }
            
            
            Spacer()
                .frame(width: 10)
            
            VStack{
                Text("You have got the location information of the treasure!")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 2.0).delay(1.0), value: isAnimating)
                Spacer().frame(height: 20)
                Text("The countries presented below are neighboring countries with hidden treasures.")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 2.0).delay(3.0), value: isAnimating)
                Spacer().frame(height: 20)
                
                
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()),GridItem(.flexible())], spacing: 16) {
                    ForEach(quizCountry.neighbors) { neighbor in
                        
                        VStack{
                            Text(neighbor)
                                .font(.system(size: 60))
                                .fontWeight(.heavy)
                                .frame(width:100,height: 30)
                                .minimumScaleFactor(0.001)
                        }
                        
                    }
                }
                .multilineTextAlignment(.center)
                .background(Color(.yellow))
                .font(.system(size: 40))
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.0).delay(4.0), value: isAnimating)
                Spacer()
                    .frame(height: 20)
                
                Text("Use the map on the left to find out the country where the treasure is hidden and press the name of the country among the buttons below")
                    .font(.system(size: 15))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .opacity(isAnimating ? 1 : 0)
                    .animation(Animation.easeIn(duration: 2.0).delay(6.0), value: isAnimating)
                    
                    Spacer()
                        .frame(height: 50)
                
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
                                            .frame(width:200,height: 60)
                                        Text(country)
                                            .foregroundColor(.white)
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .frame(width:100,height: 43)
                                            .scaledToFit()
                                            .minimumScaleFactor(0.001) // 텍스트의 최소 스케일 값을 지정
                                            .lineLimit(nil)
                                    }
                                    
                                }
                                .alert(isPresented: $showAlert) {
                                    Alert(title: Text("No Treasure"), message: Text("Find Again"), dismissButton: .default(Text("OK")))
                                }
                            }
                            
                        }
                    }
                    .frame(width: 100,height: 200)
                .animation(Animation.easeIn(duration: 1.0).delay(6.0), value: isAnimating)
                
                
            }


            
        }
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
        
        .onAppear {
            self.isNavigationLinkActive = true
            let randomIndex = Int.random(in: 0..<countries.count)
            quizCountry = countries[randomIndex]
            
            var array = countries.map{$0.name}.filter{$0 != quizCountry.name && !quizCountry.neighbors.contains($0)}.shuffled().prefix(4).sorted()
            lazy var answerIndex = Int.random(in: 0..<array.count)
            array[answerIndex] = quizCountry.name
            selectedElements = array
            
            isAnimating = true
        }
    }
    
}

struct CountryQuizView_Previews: PreviewProvider {
    @State var isNavigationLinkActive = false
    
    static var previews: some View {
        CountryQuizView(continentName: "Asia", countries: ModelData().countries, isNavigationLinkActive: .constant(true))
            .previewInterfaceOrientation(.landscapeRight).previewDevice("iPad mini (6th generation)")
    }
    
}
