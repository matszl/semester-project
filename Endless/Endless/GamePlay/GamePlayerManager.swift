//
//  GamePlayerManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 03. 11..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit
import SceneKit

extension GameViewController {
    func setupTraffic() {
        let leftAction = SCNAction.repeatForever(SCNAction.move(by: SCNVector3Make(-2.0, 0, 0), duration: 1.0))
        leftAction.speed = 1.5
        let rightAction = SCNAction.repeatForever(SCNAction.move(by: SCNVector3Make(2.0, 0, 0), duration: 1.0))
        rightAction.speed = 2.0
        
        for childNode in trafficNode.childNodes {
            childNode.runAction(childNode.eulerAngles.y > 0 ? leftAction : rightAction)
        }
    }
    
    func moveGamer(to direction: UISwipeGestureRecognizerDirection) {
        self.gamePlayer.runAction(direction.actions)
        self.updateCamera(with: direction.moveAction)
    }
    
    func updateTraffic() {
        let playerPosition = self.gamePlayer.position
        for childNode in trafficNode.childNodes {
            if childNode.position.x > playerPosition.x + 25 {
                childNode.position.x = playerPosition.x - 25
            }
            else if childNode.position.x < playerPosition.x - 25 {
                childNode.position.x = playerPosition.x + 25
            }
            
            if childNode.position.z > playerPosition.z + 10 {
                childNode.position.z = playerPosition.z - 10
            }
            else if childNode.position.z < playerPosition.z - 10 {
                childNode.position.z = playerPosition.z + 10
            }
        }
    }
}

extension GameViewController : SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didApplyAnimationsAtTime time:
        TimeInterval) {
        self.updateTraffic()
    }
}

extension UISwipeGestureRecognizerDirection {
    var actions: SCNAction {
        return SCNAction.group(self.actionsNeeded)
    }
    
    private var actionsNeeded: [SCNAction] {
        var actions: [SCNAction] = []
        let constants = GameConstants.shared
        switch self {
        case .up:
            actions = [constants.turnForwardAction, constants.bounceAction, constants.moveForwardAction]
        case .down:
            actions = [constants.turnBackwardAction, constants.bounceAction, constants.moveBackwardAction]
        case .left:
            actions = [constants.turnLeftAction, constants.bounceAction, constants.moveLeftAction]
        case .right:
            actions = [constants.turnRightAction, constants.bounceAction, constants.moveRightAction]
        default:
            actions = [constants.bounceAction]
        }
        return actions
    }
    
    var moveAction: SCNAction? {
        return self.actionsNeeded.last
    }
}
