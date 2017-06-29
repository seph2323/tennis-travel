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
   var  numberOfLives: Int = 0
    
    override func didMove(to view: SKView)
        {
        physicsWorld.contactDelegate = self
            self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            
            
            createBackground()
            makeTennisBall()
            makeRacket1()
            makeRacket2()
            makeNet()
            makeGreenRight()
            makeGreenLeft()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            tennisRacket.position.x = location.x
            tennisBall.physicsBody?.isDynamic = true
            tennisBall.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5))
        }
  
        func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for touch in touches {
                let location = touch.location(in: self)
                tennisRacket.position.x = location.x
            }
        }
        
        func didBegin(_ contact: SKPhysicsContact) {
            
            let bodyAName = contact.bodyA.node?.name
            let bodyBName = contact.bodyB.node?.name
            
            // If two items colide, make the brick disappear and add 1 to your score
            
            if bodyAName == "tennisBall" && bodyBName == "greenRight"|| bodyAName == "greenLeft"&&bodyBName == "Tennis Ball" {
                 if bodyAName == "Net" {
                    contact.bodyA.node?.action(forKey: "Redo")
                    score --1 {
                               else if bodyBName == "greenRight" ||  bodyBName == "greenLeft" {
                    contact.bodyB.node?.removeFromParent()
                                score += 5 {

                        
                    

                            }
            

                if contact.bodyA.node?.name == "loseZone" ||
                    contact.bodyB.node?.name == "loseZone" {
                    numberOfLives += 1
                    if numberOfLives < 3 {
                        print("You are on life", numberOfLives + 1)
                    }
                    if numberOfLives == 3 {
                        print("You made", score, "Serves!!\nBut You Still Lost!!")
                    }
                }
            }

            override func update(currentTime: TimeInterval) {
                if (score == 60) {
                    print( "You totally won, dude!!!!\nYou Totally scored all", score,  "Points!!!!!!!")
                    self.view?.isPaused = true
                }
            }
    
            func createBackground() {
                let tenniscourt = SKTexture(imageNamed: "Tennis Court")
                for i in 0...1 {
                    let tennisCourtBackground = SKSpriteNode(texture: tennis court)
                    tennisCourtBackground.zPosition = -1
                    tennisCourtBackground.position = CGPoint(x: 0, y: tennisCourtBackground.size.height * CGFloat(i))
                    addChild(starsBackground)
                    let moveDown = SKAction.moveBy(x: 0, y: -tennisCourtBackground.size.height, duration: 20)
                    let moveReset = SKAction.moveBy(x:0, y: tennisCourtBackground.size.height, duration: 0)
                    let moveLoop = SKAction.sequence([moveDown, moveReset])
                    let moveForever = SKAction.repeatForever(moveLoop)
                    tennisCourtBackground.run(moveForever)
                }
            }

          func   makeTennisBall() {
                ball = SKShapeNode(circleOfRadius: 10)
                ball.position = CGPoint(x: frame.midX, y: frame.midY)
                ball.strokeColor = UIColor.black
                ball.fillColor = UIColor.yellow
                ball.name = "tennisBall"
                ball.physicsBody = SKPhysicsBody(circleOfRadius: 10)
                ball.physicsBody?.isDynamic = false//ignores all forces and impulses
                ball.physicsBody?.usesPreciseCollisionDetection = true
                ball.physicsBody?.friction = 0
                ball.physicsBody?.affectedByGravity = false
                ball.physicsBody?.restitution = 1
                ball.physicsBody?.linearDamping = 0
                ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
                
                addChild(ball)

            }
    
            func makeRacket1() {
                tennisRacket = SKSpriteNode(color: UIColor.white, size: CGSize(width: frame.width/4, height: 20))
                tennisRacket.position = CGPoint(x: frame.midX, y: frame.minY + 125)
                tennisRacket.name = "tennisRacket1"
                tennisRacket.physicsBody = SKPhysicsBody(rectangleOf: tennisRacket.size)
                tennisRacket.physicsBody?.isDynamic = false
                addChild(tennisRacket)
            }
            
            func makeRacket2() {
                tennisRacket = SKSpriteNode(color: UIColor.white, size: CGSize(width: frame.width/4, height: 20))
                tennisRacket.position = CGPoint(x: frame.minX, y: frame.midY + 125)
                tennisRacket.name = "tennisRacket2"
                tennisRacket.physicsBody = SKPhysicsBody(rectangleOf: tennisRacket.size)
                tennisRacket.physicsBody?.isDynamic = false
                addChild(tennisRacket)
            }
    
            func makeLoseZone() {
                func makeLoseZone() {
                    let loseZone = SKSpriteNode(color: UIColor.brown, size: CGSize(width: frame.width, height: 50))
                    loseZone.position = CGPoint(x: frame.maxX, y: frame.maxY + 25)
                    loseZone.name = "loseZone"
                    loseZone.physicsBody = SKPhysicsBody(rectangleOf: loseZone.size)
                    loseZone.physicsBody?.isDynamic = false
                    addChild(loseZone)

            }
    
                func makegreenRight() {
                    let greenRight = SKSpriteNode(color: UIColor.green, size: CGSize(width: frame.width, height: 50))
                    greenRight.position = CGPoint(x: frame.maxX - 70, y: frame.maxY - 30)
                    greenRight.name = "greenRight"
                    greenRight.physicsBody = SKPhysicsBody(rectangleOf: greenRight.size)
                    greenRight.physicsBody?.isDynamic = false
                    addChild(greenRight)

                }
                
                func makegreenRight2() {
                    let greenRight2 = SKSpriteNode(color: UIColor.green, size: CGSize(width: frame.width, height: 50))
                    greenRight2.position = CGPoint(x: frame.minX - 70, y: frame.minY - 30)
                    greenRight2.name = "greenRight2"
                    greenRight2.physicsBody = SKPhysicsBody(rectangleOf: greenRight2.size)
                    greenRight2.physicsBody?.isDynamic = false
                    addChild(greenRight2)

                }
                
                func makeGreenLeft() {
                    let greenLeft = SKSpriteNode(color: UIColor.green, size: CGSize(width: frame.width, height: 50))
                    greenLeft.position = CGPoint(x: frame.maxX - 325, y: frame.maxY - 30)
                    greenLeft.name = "greenLeft"
                    greenLeft.physicsBody = SKPhysicsBody(rectangleOf: greenLeft.size)
                    greenLeft.physicsBody?.isDynamic = false
                    addChild(greenLeft)
                }
    
                func makeGreenLeft2() {
                    let greenLeft2 = SKSpriteNode(color: UIColor.green, size: CGSize(width: frame.width, height: 50))
                    greenLeft2.position = CGPoint(x: frame.maxX - 325, y: frame.maxY - 30)
                    greenLeft2.name = "greenLeft2"
                    greenLeft2.physicsBody = SKPhysicsBody(rectangleOf: greenLeft2.size)
                    greenLeft2.physicsBody?.isDynamic = false
                    addChild(greenLeft2)

                }
                
}
        }}}
