//
//  GameViewController.swift
//  Pop A Lock
//
//  Created by Daniel Colangelo on 4/17/16.
//  Copyright (c) 2016 Daniel Colangelo. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var continueMode = Bool()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: view.bounds.size)
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
  /*
         Where ive left off !!!
         
         
        if continueIsTrue = continueMode {
            scene.continueMode = continueIsTrue
        }
   */
            skView.presentScene(scene)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    
}
