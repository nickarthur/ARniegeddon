//
//  GameScene.swift
//  ARKitSample
//
//  Created by Marcelo Chaves on 25/04/19.
//  Copyright © 2019 Marcelo Chaves. All rights reserved.
//

import SpriteKit
import GameplayKit
import ARKit

class GameScene: SKScene {
    
    var sceneView: ARSKView {
        return view as! ARSKView
    }
    var isWorldSetUp = false
    
    private func setUpWorld() {
        guard let currentFrame = sceneView.session.currentFrame else { return }
        var translation = matrix_identity_float4x4
        translation.columns.3.z = -0.3
        let transform = currentFrame.camera.transform * translation
        let anchor = ARAnchor(transform: transform)
        sceneView.session.add(anchor: anchor)
        
        isWorldSetUp = true
    }
    
    override func update(_ currentTime: TimeInterval) {
        if !isWorldSetUp {
            setUpWorld()
        }
    }
}
