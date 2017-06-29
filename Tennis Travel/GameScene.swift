//
//  GameScene.swift
//  Tennis Travel
//
//  Created by Sephiroth Rivera on 6/29/17.
//  Copyright © 2017 Sephiroth Rivera. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate
    {
  
        var tennisBall = SKShapeNode()
    var tennisRacket = SKSpriteNode()
    var tennisRacketTwo = SKSpriteNode()
    var loseZone = SKSpriteNode()
    var score: Int = 0
    
    override func didMove(to view: SKView)
        {
        physicsWorld.contactDelegate = self
            self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            
            
            createBackground()
            makeTennisBall()
            makeRacket1()
            makeRacket2()
    }
    
    
    
    
    
    
    
    
    
}
