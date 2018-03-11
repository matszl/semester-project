//
//  TouchManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 03. 11..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit
import SceneKit

extension GameViewController {
    func setupGestures() {
        self.addSwipeGesture(direction: .left)
        self.addSwipeGesture(direction: .right)
        self.addSwipeGesture(direction: .up)
        self.addSwipeGesture(direction: .down)
    }
    
    private func addSwipeGesture(direction: UISwipeGestureRecognizerDirection, receiver: SCNView? = nil) {
        let base = receiver ?? self.mainSceneView
        let swipe = self.createSwipeGestureRecognizer()
        swipe.direction = direction
        base?.addGestureRecognizer(swipe)
    }
    
    private func createSwipeGestureRecognizer() -> UISwipeGestureRecognizer {
        return UISwipeGestureRecognizer(target: self, action: #selector(GameViewController.handleSwipe(_:)))
    }
    
    @objc private func handleSwipe(_ swipe: UISwipeGestureRecognizer) {
        self.moveGamer(to: swipe.direction)
    }
}
