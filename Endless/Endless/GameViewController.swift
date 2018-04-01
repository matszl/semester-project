//
//  GameViewController.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 02. 17..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
    var gameState: GameStateType = GameStateType.tapToPlay
    
    var mainSceneView: SCNView!
    
    var splashScene: SCNScene!
    var gameScene: SCNScene!
    
    var gamePlayer: SCNNode!
    var cameraFollowNode: SCNNode!
    private lazy var initialPlayerPosition: SCNVector3 = {
        return self.gamePlayer.position
    }()
    var centeringHelp: SCNVector3 {
        return self.initialPlayerPosition
//        return SCNVector3.init(x: 0, y: 0, z: 0)
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupNodes()
        
        self.setupGestures()
    }
    
    private func setupNodes() {
        self.mainSceneView = SCNView(frame: self.view.bounds)
        self.view.addSubview(self.mainSceneView)
        
        self.splashScene = SCNScene(named: "art.scnassets/splash.scn")
        self.gameScene = SCNScene(named: "art.scnassets/GameScene.scn")
        self.mainSceneView.scene = self.gameScene
        
        self.gamePlayer = self.gameScene.rootNode.childNode(withName: "player", recursively: true)!
        self.cameraFollowNode = gameScene.rootNode.childNode(withName: "FollowCamera", recursively: true)!
    }
}
