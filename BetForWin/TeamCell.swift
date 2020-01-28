//
//  TeamCell.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 28/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import Foundation
import UIKit

class TeamCell: UITableViewCell {
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var position: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var playedGame: UILabel!
    @IBOutlet weak var won: UILabel!
    @IBOutlet weak var draw: UILabel!
    @IBOutlet weak var lost: UILabel!
    @IBOutlet weak var goalsFor: UILabel!
    @IBOutlet weak var goalsAgainst: UILabel!
    @IBOutlet weak var goalsDifference: UILabel!
    
    let abrev: [String:String] = [
        "Paris Saint-Germain FC":"PSG",
        "Olympique de Marseille":"OM",
        "Stade Rennais FC 1901":"Renne",
        "Montpellier HSC":"Montpellier",
        "Olympique Lyonnais":"OL",
        "FC Nantes":"Nante",
        "Lille OSC":"Lille",
        "RC Strasbourg Alsace":"Strasbourg",
        "Angers SCO":"Angers",
        "FC Girondins de Bordeaux":"Bordeaux",
        "Stade de Reims":"Reims",
        "OGC Nice":"Nice",
        "AS Monaco FC":"Monaco",
        "Stade Brestois 29":"Brest",
        "AS Saint-Étienne":"Saint-Étienne",
        "FC Metz":"Metz",
        "Dijon Football Côte d'Or":"DFCO",
        "Amiens SC":"Amiens",
        "Nîmes Olympique":"Nîmes",
        "Toulouse FC":"Toulouse",
    ]
    
    
    func setTeam(team: Team) {
        self.teamName.text = abrev["\(team.nameTeam)"]
        self.position.text = String(team.position)
        self.points.text = String(team.point)
        self.playedGame.text = String(team.playedGame)
        self.won.text = String(team.won)
        self.draw.text = String(team.draw)
        self.lost.text = String(team.lost)
        self.goalsFor.text = String(team.goalsFor)
        self.goalsAgainst.text = String(team.foalsAgainst)
        self.goalsDifference.text = String(team.goalDifference)
    }
}
