//
//  PlayerCell.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 24/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import Foundation
import UIKit

class PlayerCell: UITableViewCell {
    @IBOutlet weak var numPlayer: UILabel!
    @IBOutlet weak var namePlayer: UILabel!
    
    func setPlayer(player: Player) {
        self.numPlayer.text = String(player.numPlayer)
        self.namePlayer.text = player.namePlayer
    }
}
