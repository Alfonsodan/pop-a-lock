//
//  Extensions.swift
//  Pop A Lock
//
//  Created by Daniel Colangelo on 4/17/16.
//  Copyright © 2016 Daniel Colangelo. All rights reserved.
//

import Foundation
import SpriteKit

extension CGFloat {

    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
    
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    
    }

}
