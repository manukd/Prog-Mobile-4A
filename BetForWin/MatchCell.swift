//
//  CellTableViewCell.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 06/01/2020.
//  Copyright © 2020 Emmanuel Derepas. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {
    
    @IBOutlet weak var team1: UILabel!
    @IBOutlet weak var team2: UILabel!
    @IBOutlet weak var scoreT1: UILabel!
    @IBOutlet weak var scoreT2: UILabel!
    @IBOutlet weak var matchStatus: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    
    func setMatch(match: Match) {
        team1.text = match.team1
        team2.text = match.team2
        scoreT1.text = match.scoreT1
        scoreT2.text = match.scoreT2
        
        let abrev: [String:String] = [
            "SCHEDULED":"Prévu",
            "PAUSED":"Mi-temps",
            "LIVE":"En cours",
            "IN_PLAY":"En cours",
            "FINISHED":"Terminé",
            "POSTPONED":"Repoussé",
            "SUSPENDED":"Suspendu",
            "CANCELED":"Annulé"
        ]
        matchStatus.text = abrev["\(match.matchStatus)"]
        switch match.matchStatus {
        case "SCHEDULED", "PAUSED":
            matchStatus.backgroundColor = UIColor.systemOrange
        case "LIVE", "IN_PLAY":
            matchStatus.backgroundColor = UIColor.systemGreen
        case "FINISHED", "POSTPONED", "SUSPENDED", "CANCELED":
            matchStatus.backgroundColor = UIColor.systemRed
        default:
            matchStatus.backgroundColor = UIColor.systemOrange
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatter.date(from: match.date)
        formatter.dateFormat = "dd-MM-yyyy à HH:mm"
        matchDate.text = "Le \(formatter.string(from: date!))"
    }

}
