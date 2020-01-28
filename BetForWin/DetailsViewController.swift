//
//  DetailsViewController.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 20/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var listeViewPlayerHT: UITableView!
    @IBOutlet weak var listeViewPlayerAT: UITableView!
    var matchDetailsInfo: Match?
    var tabPlayersHT = [Player]()
    var tabPlayersAT = [Player]()
    var infoplayersHT: String = ""
    var infoplayersAT: String = ""
    var idHT = 0
    var idAT = 0
    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var scoreHT: UILabel!
    @IBOutlet weak var scoreAT: UILabel!
    @IBOutlet weak var playersHT: UILabel!
    @IBOutlet weak var playersAT: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let match = matchDetailsInfo {
            self.homeTeam.text = match.team1
            self.awayTeam.text = match.team2
            self.scoreHT.text = match.scoreT1
            self.scoreAT.text = match.scoreT2
            self.idHT = match.idT1
            self.idAT = match.idT2
        }
        self.tabPlayersHT = initPlayer(teamId: self.idHT)
        self.tabPlayersAT = initPlayer(teamId: self.idAT)
        // Do any additional setup after loading the view.
    }
    
    func initPlayer(teamId: Int) -> [Player] {
        var resTab = [Player]()
        let semaphore = DispatchSemaphore(value: 0)
        let headers = [
            "x-rapidapi-host": "https://api.football-data.org/v2/",
            "X-Auth-Token": "ca272f4383e94374906b8d9a99d6a2c2"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.football-data.org/v2/teams/" + String(teamId))! as URL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask1 = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                guard let content = data else {
                    print("No data")
                    return
                }
                if let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any]
                {
                    if let squad = json["squad"] as? Array<Dictionary<String, Any>> {
                        for item in squad {
                            let actualPlayer = Player(nameP: item["name"] as? String ?? "", numP: item["shirtNumber"] as? Int ?? 0, natio: item["nationality"] as? String ?? "", role: item["PLAYER"] as? String ?? "", position: item["position"] as? String ?? "")
                            resTab.append(actualPlayer)
                        }
                        semaphore.signal()
                    }
                }
                else {
                    print("Not containing JSON")
                    return
                }
            }
        })

        dataTask1.resume()
        semaphore.wait()
        return resTab
    }
    
    
    @IBAction func action(_ sender: Any) {
        tabPlayersAT = []
        tabPlayersHT = []
        listeViewPlayerAT.reloadData()
        listeViewPlayerHT.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == listeViewPlayerHT) {
            return tabPlayersHT.count
        } else {
            return tabPlayersAT.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let player: Player
        let cell: PlayerCell
        if(tableView == listeViewPlayerHT) {
            player = tabPlayersHT[indexPath.row]
            cell = listeViewPlayerHT.dequeueReusableCell(withIdentifier: "playerCell") as! PlayerCell
            cell.setPlayer(player: player)
        } else {
            player = tabPlayersAT[indexPath.row]
            cell = listeViewPlayerAT.dequeueReusableCell(withIdentifier: "playerCell") as! PlayerCell
            cell.setPlayer(player: player)
        }
        return cell
    }
}
