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
    
    var gamePlayer: SCNNode!
    var cameraNode: SCNNode!
    var cameraFollowNode: SCNNode!
    var trafficNode: SCNNode!
    
    var gameState: GameStateType = GameStateType.playing
    
    var mainSceneView: SCNView! {
        didSet {
            self.mainSceneView.delegate = self
        }
    }
    
    var splashScene: SCNScene!
    var gameScene: SCNScene! {
        didSet {
            self.gameScene.physicsWorld.contactDelegate = self
        }
    }
    
    private lazy var initialPlayerPosition: SCNVector3 = {
        return self.gamePlayer.position
    }()
    var centeringHelp: SCNVector3 {
        return self.initialPlayerPosition
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
        
        self.setupScenes()
        self.setupNodes()
        self.setupTraffic()
        self.setupCollisions()
        self.setupGestures()
    }
    
    private func setupScenes() {
        self.mainSceneView = SCNView(frame: self.view.bounds)
        self.view.addSubview(self.mainSceneView)
        
        self.splashScene = SCNScene(named: "art.scnassets/splash.scn")
        self.gameScene = SCNScene(named: "art.scnassets/GameScene.scn")
        self.mainSceneView.scene = self.gameScene
        
    }
    
    private func setupNodes() {
        self.gamePlayer = self.gameScene.rootNode.childNode(withName: "suv", recursively: true)!
        self.cameraNode = self.gameScene.rootNode.childNode(withName: "camera", recursively: true)!
        self.cameraFollowNode = self.gameScene.rootNode.childNode(withName: "FollowCamera", recursively: true)!
        self.trafficNode = self.gameScene.rootNode.childNode(withName: "Traffic", recursively: true)!
    }
}
