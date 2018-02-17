//
//  GameCenterManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 02. 17..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import Foundation
import GameKit

class GameCenterManager: NSObject {
    
    static let shared = GameCenterManager()
    
    func attemptLogin(from baseViewController: UIViewController) {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = { (viewController, error) -> Void in
            if let viewController = viewController {
                baseViewController.present(viewController, animated: true, completion: nil)
            }
            else if (localPlayer.isAuthenticated) {
                // 2. Player is already authenticated & logged in, load game center
//                self.gcEnabled = true
                
                // Get the default leaderboard ID
                localPlayer.loadDefaultLeaderboardIdentifier(completionHandler: { (leaderboardIdentifer, error) in
                    if let leaderBoardId = leaderboardIdentifer {
                        let defaultLeaderBoard = leaderBoardId
                        print("LeaderBoardId is \(defaultLeaderBoard)")
                    }
                    else if let error = error {
                        print(error)
                    }
                })
                
            }
            else if let error = error {
                // 3. Game center is not enabled on the users device
//                self.gcEnabled = false
                print("Local player could not be authenticated: \(error)")
            }
        }
    }
}

// MARK: - Game Center Delegate

extension GameCenterManager: GKGameCenterControllerDelegate {
    
    func gameCenterViewControllerDidFinish(_ gameCenterViewController: GKGameCenterViewController) {
        gameCenterViewController.dismiss(animated: true, completion: nil)
    }
        
}
