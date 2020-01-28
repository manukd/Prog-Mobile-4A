//
//  Match.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 06/01/2020.
//  Copyright © 2020 Emmanuel Derepas. All rights reserved.
//

import Foundation
import UIKit

class Match {
    var matchStatus: String
    var team1: String
    var idT1: Int
    var idT2: Int
    var team2: String
    var scoreT1: String
    var scoreT2: String
    var date: String
    
    init(team1: String, team2: String, scoreT1: String, scoreT2: String, status: String, idT1: Int, idT2: Int, date: String) {
        self.team1 = team1
        self.team2 = team2
        self.scoreT1 = scoreT1
        self.scoreT2 = scoreT2
        self.matchStatus = status
        self.idT1 = idT1
        self.idT2 = idT2
        self.date = date
    }
}
