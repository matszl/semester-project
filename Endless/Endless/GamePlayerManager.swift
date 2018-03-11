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
    func moveGamer(to direction: UISwipeGestureRecognizerDirection) {
        self.gamePlayer.runAction(direction.actions)
    }
}

extension UISwipeGestureRecognizerDirection {
    var actions: SCNAction {
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
        return SCNAction.group(actions)
    }
}
