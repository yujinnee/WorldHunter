//
//  TreasureView.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/18.
//

import SwiftUI
import ARKit
import RealityKit

struct TreasureView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isAnimating = false
    var body: some View {
        VStack {
            Text("Wow! You got a treasure!")
                .font(.system(size: 30))
                .fontWeight(.black)
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.0).delay(0), value: isAnimating)
            Text("Check your treasure through the camera!")
                .font(.system(size: 20))
                .fontWeight(.regular)
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.0).delay(1.0), value: isAnimating)
            Text("If you look around, there will be treasure.")
                .font(.system(size: 20))
                .fontWeight(.regular)
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.0).delay(1.0), value: isAnimating)
            
            ARView().frame(width: 700, height: 500)
                .opacity(isAnimating ? 1 : 0)
                .animation(Animation.easeIn(duration: 1.0).delay(1.0), value: isAnimating)
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image("btnAnother")
                    .resizable()
                    .frame(width: 504/2,height: 79/2)
            })
            
            .opacity(isAnimating ? 1 : 0)
            .animation(Animation.easeIn(duration: 1.0).delay(3.0), value: isAnimating)
      
           
        }.onAppear{
            isAnimating = true
        }
        .navigationBarBackButtonHidden(true)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
       
    
        
    }
    
    
    
    

}


//struct TreasureView_Previews: PreviewProvider {
//    static var previews: some View {
//        TreasureView().environmentObject(DISmis)
//    }
//}

struct ARView:UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        
        guard let url = Bundle.main.url(forResource: "treasure", withExtension: "usdz") else { fatalError() }
        
        let scene = try! SCNScene(url: url, options: [.checkConsistency: true])
        sceneView.scene = scene
        
        let spotLight = SCNNode()
        spotLight.light = SCNLight()
        spotLight.light?.type = .directional
        spotLight.eulerAngles = SCNVector3(x: -Float.pi / 4, y: Float.pi / 4, z: 0)

        sceneView.scene.rootNode.addChildNode(spotLight)
        
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}



