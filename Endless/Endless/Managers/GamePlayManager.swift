//
//  GamePlayManager.swift
//  Endless
//
//  Created by Mate Szlanka on 2018. 04. 01..
//  Copyright © 2018. mateszlanka. All rights reserved.
//

import Foundation

public enum GameStateType {
    case tapToPlay
    case playing
    case gameOver
}

extension GameViewController {
    func updateState(_ state: GameStateType) {
        self.gameState = state
    }
}
