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
    var sight: SKSpriteNode!

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
        
        // 1
        guard let currentFrame = sceneView.session.currentFrame, let lightEstimate = currentFrame.lightEstimate else { return }
        
        // 2
        let neutralIntensity: CGFloat = 1000
        let ambientIntensity = min(lightEstimate.ambientIntensity, neutralIntensity)
        let blendFactor = 1 - ambientIntensity / neutralIntensity
        
        // 3
        for node in children {
            if let bug = node as? SKSpriteNode {
                bug.color = .black
                bug.colorBlendFactor = blendFactor
            }
        }
    }
    
    override func didMove(to view: SKView) {
        sight = SKSpriteNode(imageNamed: "sight")
        addChild(sight)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        let location = sight.position
        let hitNodes = nodes(at: location)
        
        var hitBug: SKNode?
        for node in hitNodes {
            if node.name == "bug" {
                hitBug = node
                break
            }
        }
        
        run(Sounds.fire)
        if let hitBug = hitBug,
            let anchor = sceneView.anchor(for: hitBug) {
            let action = SKAction.run {
                self.sceneView.session.remove(anchor: anchor)
            }
            let group = SKAction.group([Sounds.hit, action])
            let sequence = [SKAction.wait(forDuration: 0.3), group]
            hitBug.run(SKAction.sequence(sequence))
        }
    }
}
