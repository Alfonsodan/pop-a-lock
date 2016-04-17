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
    
    var path = UIBezierPath()
    
    let zeroAngle: CGFloat = 0.0
    
    override func didMoveToView(view: SKView) {
        layoutGame()
     
    }
    
    func layoutGame() {
    
        backgroundColor = SKColor.whiteColor()
        
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.width/2, y: self.frame.height/2), radius: 120, startAngle: zeroAngle, endAngle: zeroAngle + CGFloat(M_PI + 2), clockwise: true)
        
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
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */

    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
