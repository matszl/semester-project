//
//  Constants.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 03. 11..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import Foundation
import SceneKit

class GameConstants {
    static let shared: GameConstants = GameConstants()
    
    private let duration = 0.2
    
    private lazy var bounceUpAction: SCNAction = {
        let action = SCNAction.moveBy(x: 0, y: 1.0, z: 0, duration: self.duration * 0.5)
        action.timingMode = .easeOut
        return action
    }()

    private lazy var bounceDownAction: SCNAction = {
        let action = SCNAction.moveBy(x: 0, y: -1.0, z: 0, duration: self.duration * 0.5)
        action.timingMode = .easeIn
        return action
    }()
    
    lazy var bounceAction: SCNAction = {
        return SCNAction.sequence([self.bounceUpAction, self.bounceDownAction])
    }()
    
    lazy var moveLeftAction: SCNAction = {
        return SCNAction.moveBy(x: 0, y: 0, z: 1.0, duration: self.duration)
    }()
    
    lazy var moveRightAction: SCNAction = {
        return SCNAction.moveBy(x: 0, y: 0, z: -1.0, duration: self.duration)
    }()
    
    lazy var moveForwardAction: SCNAction = {
        return SCNAction.moveBy(x: -1.0, y: 0, z: 0, duration: self.duration)
    }()
    
    lazy var moveBackwardAction: SCNAction = {
        return SCNAction.moveBy(x: 1.0, y: 0, z: 0, duration: self.duration)
    }()
    
    lazy var turnLeftAction: SCNAction = {
        return SCNAction.rotateTo(x: 0, y: Math.shared.convertToRadians(angle: -90), z: 0, duration: self.duration, usesShortestUnitArc: true)
    }()
    
    lazy var turnRightAction: SCNAction = {
        return SCNAction.rotateTo(x: 0, y: Math.shared.convertToRadians(angle: 90), z: 0, duration: self.duration, usesShortestUnitArc: true)
    }()
    
    lazy var turnForwardAction: SCNAction = {
        return SCNAction.rotateTo(x: 0, y: Math.shared.convertToRadians(angle: 180), z: 0, duration: self.duration, usesShortestUnitArc: true)
    }()
    
    lazy var turnBackwardAction: SCNAction = {
        return SCNAction.rotateTo(x: 0, y: Math.shared.convertToRadians(angle: 0), z: 0, duration: self.duration, usesShortestUnitArc: true)
    }()
}
