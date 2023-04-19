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
    @State var isNavigationLinkActive = false

    @EnvironmentObject var modelData: ModelData

    
    var body: some View {
        VStack{
            //        let earthScene = EarthScene()
            Text("From now on, you will go hunting for hidden treasures all over the world.")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .background(.yellow)
            Spacer()
                .frame(height: 10)
            Text("Please choose which continent to go looking for treasure.")
                .font(.system(size: 25))
                .fontWeight(.regular)
            Spacer()
                .frame(height:10)
            Text("Swipe the Earth and look at the continent you want!")
                .font(.system(size: 20))
                .fontWeight(.semibold)
           
            HStack{
                
                VStack{
                    
                    SceneKitView()
                        .frame(width: 600,height: 600)
                        .foregroundColor(.blue)
                    
                }
                
                VStack(alignment: .center, spacing: 0) {
                    
                  
                    ForEach(modelData.continents.keys.sorted(),id: \.self) { key in
                        
                        NavigationLink {
                            CountryQuizView(continentName: key, countries: modelData.continents[key]!,isNavigationLinkActive: $isNavigationLinkActive)            
                            
                        } label: {
                            Image("btn\(key)")
                                .resizable()
                                .frame(width:200,height: 60 )
                            
                            
                            
                        }
                        
                        
                        
                    }
                }
                
                
                
            }
            
            
        }
        .padding(EdgeInsets(top: 80, leading: 20, bottom: 20, trailing: 20))
        .onAppear {
            
            isNavigationLinkActive = false
            
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView().previewInterfaceOrientation(.landscapeRight).previewDevice("iPad mini (6th generation)").environmentObject(ModelData())
    }
}


struct SceneKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        let earthScene = EarthScene()
        sceneView.scene = earthScene
        sceneView.allowsCameraControl = true

        for recognizer in sceneView.gestureRecognizers ?? [] {
            if let panRecognizer = recognizer as? UIPanGestureRecognizer {
                panRecognizer.minimumNumberOfTouches = 1 // 한 손가락 제스처만 허용하도록 수정
                panRecognizer.maximumNumberOfTouches = 1
            }
            if let pinchRecognizer = recognizer as? UIPinchGestureRecognizer {
                pinchRecognizer.isEnabled = false
            }
        }
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {}
}
