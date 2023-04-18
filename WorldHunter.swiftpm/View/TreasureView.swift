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
    var body: some View {
        VStack {
            ARView().frame(width: 500, height: 500)
        }
    }
}

struct TreasureView_Previews: PreviewProvider {
    static var previews: some View {
        TreasureView()
    }
}

struct ARView:UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        
        guard let url = Bundle.main.url(forResource: "solar_panels", withExtension: "usdz") else { fatalError() }
        
        let scene = try! SCNScene(url: url, options: [.checkConsistency: true])
        sceneView.scene = scene
        
        let spotLight = SCNNode()
        spotLight.light = SCNLight()
        spotLight.light?.type = .directional
        
        sceneView.scene.rootNode.addChildNode(spotLight)
        
        
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        return sceneView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

