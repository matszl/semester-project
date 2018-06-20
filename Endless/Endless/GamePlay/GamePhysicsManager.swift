//
//  GamePhysicsManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 05. 08..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit
import SceneKit

extension GameViewController: SCNPhysicsContactDelegate {
    func setupCollisions() {
        if let geometry = self.gamePlayer.geometry {
            self.gamePlayer.physicsBody = SCNPhysicsBody(type: .kinematic, shape: SCNPhysicsShape(geometry: geometry, options: nil))
            self.gamePlayer.physicsBody?.categoryBitMask = CollisionMask.player.rawValue
            self.gamePlayer.physicsBody?.contactTestBitMask = CollisionMask.vehicle.rawValue
            self.gamePlayer.physicsBody?.collisionBitMask = CollisionMask.vehicle.rawValue
            for childNode in trafficNode.childNodes {
                if let childGeometry = childNode.geometry {
                    childNode.physicsBody = SCNPhysicsBody(type: .kinematic, shape: SCNPhysicsShape(geometry: childGeometry, options: nil))
                    childNode.physicsBody?.categoryBitMask = CollisionMask.vehicle.rawValue
                    childNode.physicsBody?.contactTestBitMask = CollisionMask.player.rawValue
                    childNode.physicsBody?.collisionBitMask = CollisionMask.player.rawValue
                }
            }
        }
    }
    
    func physicsWorld(_ world: SCNPhysicsWorld, didBegin contact: SCNPhysicsContact) {
        let player = [contact.nodeA, contact.nodeB].filter{ $0.physicsBody?.categoryBitMask != CollisionMask.player.rawValue }.first
        if player?.physicsBody?.categoryBitMask == CollisionMask.vehicle.rawValue {
            // Collision
            print("Catched a collision")
        }
    }
}
