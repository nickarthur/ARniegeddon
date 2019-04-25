//
//  Types.swift
//  ARKitSample
//
//  Created by Marcelo Chaves on 25/04/19.
//  Copyright © 2019 Marcelo Chaves. All rights reserved.
//

import SpriteKit

enum Sounds {
    static let fire = SKAction.playSoundFileNamed("sprayBug", waitForCompletion: false)
    static let hit = SKAction.playSoundFileNamed("hitBug", waitForCompletion: false)
    static let bugspray = SKAction.playSoundFileNamed("catchBugspray", waitForCompletion: false)
    static let win = SKAction.playSoundFileNamed("win.wav", waitForCompletion: false)
    static let lose = SKAction.playSoundFileNamed("lose.wav", waitForCompletion: false)
}
