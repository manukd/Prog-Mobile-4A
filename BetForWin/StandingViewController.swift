//
//  StandingViewController.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 27/01/2020.
//  Copyright © 2020 Emmanuel. All rights reserved.
//

import UIKit

class StandingViewController: UIViewController {
    @IBOutlet weak var standingTableView: UITableView!
    var teams = [Team]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teams = self.initStanding()
        // Do any additional setup after loading the view.
    }
    
    func initStanding() -> [Team] {
        var resTab = [Team]()
        let semaphore1 = DispatchSemaphore(value: 0)
        let headers = [
            "x-rapidapi-host": "https://api.football-data.org/v2/",
            "X-Auth-Token": "ca272f4383e94374906b8d9a99d6a2c2"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.football-data.org/v2/competitions/2015/standings")! as URL)
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
                    if let standing = json["standings"] as? [Dictionary<String, Any>] {
                        for itemStand in standing {
                            if let table = itemStand["table"] as? [Dictionary<String, Any>] {
                                for item in table {
                                    var nameT = ""
                                    var id = 0
                                    if let team = item["team"] as? Dictionary<String, Any> {
                                        nameT = team["name"] as! String
                                        id = team["id"] as! Int
                                    }
                                    let team = Team(nameTeam: nameT, teamId: id, position: item["position"] as! Int, playedGame: item["playedGames"] as! Int, won: item["won"] as! Int, draw: item["draw"] as! Int, lost: item["lost"] as! Int, point: item["points"] as! Int, goalsFor: item["goalsFor"] as! Int, foalsAgainst: item["goalsAgainst"] as! Int, goalDifference: item["goalDifference"] as! Int)
                                    resTab.append(team)
                                }
                                semaphore1.signal()
                            }
                        }
                    }
                    
                }
                else {
                    print("Not containing JSON")
                    return
                }
            }
        })

        dataTask1.resume()
        semaphore1.wait()
        return resTab
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

extension StandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let team = teams[indexPath.row]
        let cell = standingTableView.dequeueReusableCell(withIdentifier: "teamCell") as! TeamCell
        cell.setTeam(team: team)
        return cell
    }
    

}
