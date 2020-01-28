//
//  Player.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 24/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import Foundation

class Player {
    var namePlayer: String
    var numPlayer: Int
    var nationality: String
    var role: String
    var position: String
    
    init(nameP: String, numP: Int, natio: String, role: String, position: String) {
        self.namePlayer = nameP
        self.numPlayer = numP
        self.nationality = natio
        self.role = role
        self.position = position
    }
}
