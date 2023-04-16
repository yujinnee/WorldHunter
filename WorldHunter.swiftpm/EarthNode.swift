//
//  EarthNode.swift
//  WorldHunter
//
//  Created by 이유진 on 2023/04/16.
//

import SceneKit
import SwiftUI

class EarthNode: SCNNode {

    override init() {
        super.init()
        self.geometry = SCNSphere(radius: 5)
        self.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Diffuse")
        self.geometry?.firstMaterial?.specular.contents =
        UIImage(named: "Specular")
        
      
        self.geometry?.firstMaterial?.emission.contents =
        UIImage(named: "Emission")
      
        self.geometry?.firstMaterial?.normal.contents =
        UIImage(named: "Normal")
        
        self.geometry?.firstMaterial?.shininess = 50
        
        let action = SCNAction.rotate(by: 360 * CGFloat(Double.pi / 180), around: SCNVector3(x:0, y:1, z:0), duration: 8)
        
        let repeatAction = SCNAction.repeatForever(action)
        
        self.runAction(repeatAction)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
}
