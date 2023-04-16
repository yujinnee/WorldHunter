//
//  CategoryView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/12.
//

import SwiftUI
import SceneKit

extension String: Identifiable {
    public typealias ID = Int
    public var id: Int {
        return hash
    }
}

struct CategoryView: View {
    var items = ModelData().continents
    let panorama = UIImage(named:"World2") ?? UIImage()
    
    var body: some View {
        let earthScene = EarthScene()
        
        SceneView(
            scene: earthScene,
                options: [
                  .allowsCameraControl,
                  .temporalAntialiasingEnabled
                ])
                .ignoresSafeArea()
        
//        PanoramaView(image: panorama)
//                        .frame(height: 800)
        
        
//        ScrollView(.horizontal, showsIndicators: false) {
//            Image("World1")
//                .resizable()
//                .frame(width:2500, height:1500)//프레임
////            HStack(alignment: .top, spacing: 0) {
////                ForEach(items) { continent in
////                    NavigationLink {
////                        CountryQuizView(continent: continent)
////                    } label: {
////                        Label(continent, systemImage: "chevron.right.circle")
////                            .font(.headline)
////                            .padding(.leading,15)
////                            .padding(.top, 5)
////                            .foregroundColor(.black)
////                    }
////
////                }
////            }
//        }
//        .frame(height: 185)
       
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(items: ModelData().continents)
    }
}
