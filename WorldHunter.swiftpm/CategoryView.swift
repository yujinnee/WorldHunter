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
//    let panorama = UIImage(named:"World2") ?? UIImage()
    
    var body: some View {
        //        let earthScene = EarthScene()
        
        SceneKitView()
            .frame(width: 600,height: 600)
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
                //}
                .frame(height: 185)
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(items: ModelData().continents)
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
