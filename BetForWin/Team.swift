//
//  Team.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 28/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import Foundation
import UIKit

class Team {
    var nameTeam: String
    var teamId: Int
    var position: Int
    var playedGame: Int
    var won: Int
    var draw: Int
    var lost: Int
    var point: Int
    var goalsFor: Int
    var foalsAgainst: Int
    var goalDifference: Int
    
    init(nameTeam: String, teamId: Int, position: Int, playedGame: Int, won: Int, draw: Int, lost: Int, point: Int, goalsFor: Int, foalsAgainst: Int, goalDifference: Int) {
        self.nameTeam = nameTeam
        self.teamId = teamId
        self.position = position
        self.playedGame = playedGame
        self.won = won
        self.draw = draw
        self.lost = lost
        self.point = point
        self.goalsFor = goalsFor
        self.foalsAgainst = foalsAgainst
        self.goalDifference = goalDifference
    }
}
