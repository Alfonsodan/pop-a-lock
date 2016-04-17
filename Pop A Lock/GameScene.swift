//
//  GameScene.swift
//  Pop A Lock
//
//  Created by Daniel Colangelo on 4/17/16.
//  Copyright (c) 2016 Daniel Colangelo. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var lock = SKShapeNode()
    var needle = SKShapeNode()
    var dot = SKShapeNode()
    
    var path = UIBezierPath()
    
    let zeroAngle: CGFloat = 0.0
    
    var started = false
    var touches = false
    
    override func didMoveToView(view: SKView) {
        layoutGame()
     
    }
    
    func layoutGame() {
    
        backgroundColor = SKColor.whiteColor()
        
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2), radius: 120, startAngle: zeroAngle, endAngle: zeroAngle + CGFloat(M_PI * 2), clockwise: true)
        
        lock = SKShapeNode(path: path.CGPath)
        lock.strokeColor = SKColor.grayColor()
        lock.lineWidth = 40.0
        self.addChild(lock)
        
        needle = SKShapeNode(rectOfSize: CGSize(width: 40.0 - 7.0, height: 7.0), cornerRadius: 3.5)
        needle.fillColor = SKColor.whiteColor()
        needle.position = CGPoint(x: self.frame.width/2, y: self.frame.height/2 + 120)
        needle.zRotation = 3.14 / 2
        needle.zPosition = 2.0
        self.addChild(needle)
        
        newDot()
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        if !started {
            runClockwise()
            started = true
        }

    }
    
    func runClockwise() {
    
        let dx = needle.position.x - self.frame.width/2
        let dy = needle.position.y - self.frame.height/2
        
        let radian = atan2(dy, dx)
        
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2) , radius: 120, startAngle: radian, endAngle: radian + CGFloat(M_PI * 2), clockwise: true)
        let run = SKAction.followPath(path.CGPath, asOffset: false, orientToPath: true, speed: 200)
        needle.runAction(SKAction.repeatActionForever(run).reversedAction())
        
    }
    
    func newDot() {
        dot = SKShapeNode(circleOfRadius: 15.0)
        dot.fillColor = SKColor(red: 31.0/255.0, green: 150.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        dot.strokeColor = SKColor.clearColor()
        
        let dx = needle.position.x - self.frame.width/2
        let dy = needle.position.y - self.frame.height/2
        
        let radian = atan2(dy, dx)
        
        let tempAngle = CGFloat.random(radian - 1.0, max: radian - 2.5)
        let tempPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.width / 2, y: self.frame.height / 2) , radius: 120, startAngle: tempAngle, endAngle: tempAngle + CGFloat(M_PI * 2), clockwise: true)
        dot.position = tempPath.currentPoint
        
        self.addChild(dot)
        
    }
    
    func gameOver() {
        needle.removeFromParent()
        let actionRed = SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1.0, duration: 0.25)
        let actionBack = SKAction.colorizeWithColor(UIColor.whiteColor(), colorBlendFactor: 1.0, duration: 0.25)
        self.scene?.runAction(SKAction.sequence([actionRed, actionBack]), completion: { () -> Void in
            self.removeAllChildren()
            self.layoutGame()
        })
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if started {
            if needle.intersectsNode(dot) {
                touches = true
            } else {
                if touches == true {
                    if !needle.intersectsNode(dot) {
                        started = false
                        touches = false
                        gameOver()
                    }
                }
            }
        }
    }
}
