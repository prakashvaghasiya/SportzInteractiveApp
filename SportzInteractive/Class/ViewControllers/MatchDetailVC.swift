//
//  ViewController.swift
//  SportzInteractive
//
//  Created by Prakash.Vaghasiya on 10/27/22.
//

import UIKit
import SwiftyJSON

class MatchDetailVC: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var tblMatchDetails: UITableView!
    
    //MARK: Variables
    var arrayOfApis = [API_FIRST_MATCH, API_SECOND_MATCH]
    var arrayMatchDetails = [Welcome]()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: Methods
    private func setupUI() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        for apis in arrayOfApis {
            matchDetails(apiUrl: apis)
        }
        setupTableView()
    }
    
    private func setupTableView() {
        tblMatchDetails?.register(MatchDetailCell.nib, forCellReuseIdentifier: MatchDetailCell.identifier)
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension MatchDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMatchDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MatchDetailCell", for: indexPath) as? MatchDetailCell {
            cell.selectionStyle = .none
            cell.lblMatchVenue.text = arrayMatchDetails[indexPath.row].matchdetail.venue.name
            cell.lblMatchTimeDate.text = "\(arrayMatchDetails[indexPath.row].matchdetail.match.date) - \(arrayMatchDetails[indexPath.row].matchdetail.match.time)"
            cell.lblMatchTitle.text = "\(arrayMatchDetails[indexPath.row].teams.values.first?.nameFull ?? "") VS \(arrayMatchDetails[indexPath.row].teams.values.reversed().first?.nameFull ?? "")"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerDetailVC = PlayerDetailVC.initialize(from: .main)
        playerDetailVC.arrayPlayerDetail = arrayMatchDetails[indexPath.row].teams
        self.navigationController?.pushViewController(playerDetailVC, animated: true)
    }
}

//MARK: Api Calling
extension MatchDetailVC {
    func matchDetails(apiUrl: String) {
        self.view.activityStartAnimating()
        HttpRequestManager.shared.getRequestWithoutParams(endpointurl: apiUrl) { [weak self] (response, error, message) in
            if response != nil {
                if let dictionary = response as? [String: AnyObject] {
                    let decoder = JSONDecoder()
                    do {
                        let matchDetailObj = try decoder.decode(Welcome.self, from: JSON(dictionary).rawData())
                        self?.arrayMatchDetails.append(matchDetailObj)
                        self?.tblMatchDetails.reloadData()
                    } catch {
                        KVNProgress.showError(withStatus: "\(String(describing: error.localizedDescription))")
                    }
                }
            } else {
                KVNProgress.showError(withStatus: "Something Went Wrong Please Try Again!")
            }
            self?.view.activityStopAnimating()
        }
    }
}
