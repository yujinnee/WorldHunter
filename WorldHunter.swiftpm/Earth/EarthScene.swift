//
//  EarthScene.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/16.
//

import Foundation
import SwiftUI
import SceneKit

class EarthScene: SCNScene{
    override init() {
        super.init()
        
//        let sphereGeometry = SCNSphere(radius: 2)
//        sphereGeometry.firstMaterial?.diffuse.contents = Color.blue.cgColor
//        sphereGeometry.segmentCount = 20
//        
////        let sphereNode = SCNNode(geometry: sphereGeometry)
//        //            sphereNode.pulse(from: 2, to: 5, duration: 3)
        let earthNode = EarthNode()
    
        // Create directional light
//        let directionalLight = SCNNode()
//        directionalLight.light = SCNLight()
//        directionalLight.light!.type = .directional
//        directionalLight.eulerAngles = SCNVector3(x: 0, y: 0, z: 0)
//
//        let myAmbientLight = SCNLight()
//        myAmbientLight.type = .ambient
//        myAmbientLight.intensity = 100
//        let myAmbientLightNode = SCNNode()
//        myAmbientLightNode.light = myAmbientLight
//
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        cameraNode.position = SCNVector3(x: 10, y: 10, z: 10)
//        let centerConstraint = SCNLookAtConstraint(target: earthNode)
//        cameraNode.constraints = [centerConstraint]
        
//        rootNode.addChildNode(cameraNode)
//        rootNode.addChildNode(directionalLight)
//        rootNode.addChildNode(myAmbientLightNode)
        rootNode.addChildNode(earthNode)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
