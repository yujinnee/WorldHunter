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
    //    var items = ModelData().continents
    @EnvironmentObject var modelData: ModelData
    //    let panorama = UIImage(named:"World2") ?? UIImage()
    
    var body: some View {
        VStack{
            //        let earthScene = EarthScene()
            Text("From now on, you will go hunting for hidden treasures all over the world.")
                .font(.headline)
            Text("Please choose which continent to go looking for treasure.")
                .font(.headline)
            
            
            HStack{
                SceneKitView()
                    .frame(width: 600,height: 600)
                    .foregroundColor(.blue)
                
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
                
                
                
                
                //            .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged { _ in })
                //        SceneView(
                //            scene: earthScene
                //            ,
                //                options: [
                //                  .allowsCameraControl,
                ////                  .temporalAntialiasingEnabled
                //
                //                ]
                //        )
                //        .gesture(PinchGesture().onChanged { _ in })
                
                
                
                
                //        PanoramaView(image: panorama)
                //                        .frame(height: 800)
                
                
                //        ScrollView(.horizontal, showsIndicators: false) {
                //            Image("World1")
                //                .resizable()
                //                .frame(width:2500, height:1500)//프레임
                
            }
            
            
        }
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
        // UIPinchGestureRecognizer 비활성화
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
