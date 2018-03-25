//
//  GameCameraManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 03. 25..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit
import SceneKit

extension GameViewController {
    func updateCamera(with action: SCNAction? = nil) {
        let duration: TimeInterval = 0.3
        if let action = action {
            action.duration = duration
            self.cameraFollowNode.runAction(action)
        }
        else {
            let newPosition = SCNVector3.init(x: self.gamePlayer.position.x - self.centeringHelp.x,
                                              y: self.cameraFollowNode.position.y,
                                              z: self.gamePlayer.position.z - self.centeringHelp.z)
            self.cameraFollowNode.runAction(SCNAction.move(to: newPosition, duration: duration))
        }
    }
}
