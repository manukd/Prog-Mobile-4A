//
//  ViewController.swift
//  BetForWin
//
//  Created by Emmanuel Derepas on 06/01/2020.
//  Copyright © 2020 Emmanuel Derepas. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    var Matchs: [Match] = []
    var currentDayMatch = 0
    let details_identifier = "matchsDetails"
    @IBOutlet weak var pickerView: UIPickerView!
    var pickerData: [String] = [String]()
    @IBOutlet weak var selectMatchday: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMatchDay()
        Matchs = initArray(matchday: self.currentDayMatch)
        self.pickerView.isHidden = true
        for i in 1...38 {// 38 journées dans les championnats européen
            if i != self.currentDayMatch {
                pickerData.append("Journée n°\(i)")
            } else {
                pickerData.append("Journée n°\(i) (Journée actuelle)")
            }
        }
        self.selectMatchday.text = pickerData[self.currentDayMatch - 1]
        self.pickerView.selectRow(self.currentDayMatch - 1, inComponent: 0, animated: true)
    }

    func initMatchDay() {
        let semaphore = DispatchSemaphore(value: 0)
        let headers = [
            "x-rapidapi-host": "https://api.football-data.org/v2/",
            "X-Auth-Token": "ca272f4383e94374906b8d9a99d6a2c2"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.football-data.org/v2/competitions/2015")! as URL)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                guard let content = data else {
                    print("No data")
                    return
                }
                if let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] {
                    if let currentSeason = json["currentSeason"] as? Dictionary<String, Any> {
                        if let matchday = currentSeason["currentMatchday"] as? Int {
                            self.currentDayMatch = matchday
                            semaphore.signal()
                        }
                    }
                }
                else {
                    print("Not containing JSON")
                    return
                }
            }
        })
        dataTask.resume()
        semaphore.wait()
    }
    
    func initArray(matchday: Int) -> [Match] {
        let semaphore = DispatchSemaphore(value: 0)
        var resArray: [Match] = []
        let headers = [
            "x-rapidapi-host": "https://api.football-data.org/v2/",
            "X-Auth-Token": "ca272f4383e94374906b8d9a99d6a2c2"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://api.football-data.org/v2/competitions/2015/matches?matchday=" + String(matchday))! as URL)
        
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
                    if let matchs = json["matches"] as? Array<Dictionary<String, Any>> {
                        for item in matchs {
                            var actualHT = ""
                            var idHT = 0
                            var actualAT = ""
                            var idAT = 0
                            var actualScoreHT = 0
                            var actualScoreAT = 0
                            var matchDate = item["utcDate"]
                            var actualStatus = item["status"]
                            if let homeTeam = item["homeTeam"] as? Dictionary<String, Any> {
                                actualHT = homeTeam["name"] as! String
                                idHT = homeTeam["id"] as! Int
                            }
                            if let awayTeam = item["awayTeam"] as? Dictionary<String, Any> {
                                actualAT = awayTeam["name"] as! String
                                idAT = awayTeam["id"] as! Int
                            }
                            if let score = item["score"] as? Dictionary<String, Any> {
                                if let fullTime = score["fullTime"] as? Dictionary<String, Any> {
                                    if (((fullTime["homeTeam"] as? Int) != nil) && ((fullTime["awayTeam"] as? Int) != nil)) {
                                        actualScoreHT = fullTime["homeTeam"] as! Int
                                        actualScoreAT = fullTime["awayTeam"] as! Int
                                    }
                                }
                            }
                            let awayTeam = item["awayTeam"]
                            let actualmatch = Match(team1: actualHT as! String, team2: actualAT as! String, scoreT1: String(actualScoreHT), scoreT2: String(actualScoreAT), status: actualStatus as! String, idT1: idHT, idT2: idAT, date: matchDate as! String)
                            resArray.append(actualmatch)
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
        return resArray
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == details_identifier {
            let detailViewController = segue.destination as! DetailsViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            detailViewController.matchDetailsInfo = self.Matchs[row]
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Matchs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let match = Matchs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchCell") as! MatchCell
        cell.setMatch(match: match)
        return cell
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectMatchday.text = self.pickerData[row]
        Matchs = []
        Matchs = self.initArray(matchday: row + 1)
        tableView.reloadData()
        self.pickerView.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pickerView.isHidden = false
        selectMatchday.endEditing(true)
    }
}
