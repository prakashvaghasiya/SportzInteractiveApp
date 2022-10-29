//
//  PlayerDetailVC.swift
//  SportzInteractive
//
//  Created by Prakash.Vaghasiya on 10/28/22.
//

import UIKit

class PlayerDetailVC: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var lblPlayerBowlingStyle: UILabel!
    @IBOutlet weak var lblFilter: UILabel!
    @IBOutlet weak var lblPlayerBattingStyle: UILabel!
    @IBOutlet weak var lblPlayerName: UILabel!
    @IBOutlet weak var viwPlayerStyle: UIView!
    @IBOutlet weak var tblPlayerDetail: UITableView!
    
    //MARK: Life Cycle
    var arrayPlayerDetail = [String: Team]()
    var firstTeamPlayerDetails = [Player]()
    var secondTeamPlayerDetails = [Player]()
    var filterPlayerDetails = [Player]()
    var secondTeamFilerPlayerDetails = [Player]()
    var arrayTeamsList = ["Both Teams"]
    var arrayDisplayTeamName = [String]()
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: Methods
    private func setupUI() {
        if arrayPlayerDetail.count > 0 {
            arrayTeamsList.append(arrayPlayerDetail.values.first?.nameFull ?? "")
            arrayTeamsList.append(arrayPlayerDetail.values.reversed().first?.nameFull ?? "")
            arrayDisplayTeamName.append(arrayPlayerDetail.values.first?.nameFull ?? "")
            arrayDisplayTeamName.append(arrayPlayerDetail.values.reversed().first?.nameFull ?? "")
            if let playersDetails = arrayPlayerDetail.values.first?.players {
                for player in playersDetails {
                    firstTeamPlayerDetails.append(player.value)
                }
            }
            if let playersDetails = arrayPlayerDetail.values.reversed().first?.players {
                for player in playersDetails {
                    secondTeamPlayerDetails.append(player.value)
                }
            }
            firstTeamPlayerDetails = firstTeamPlayerDetails.sorted(by: {(Int($0.position) ?? 0) < (Int($1.position) ?? 0)})
            secondTeamPlayerDetails = secondTeamPlayerDetails.sorted(by: {(Int($0.position) ?? 0) < (Int($1.position) ?? 0)})
            filterPlayerDetails = (firstTeamPlayerDetails + secondTeamPlayerDetails)
            setupTableView()
        }
    }
    
    private func setupTableView() {
        tblPlayerDetail?.register(PlayerDetailCell.nib, forCellReuseIdentifier: PlayerDetailCell.identifier)
    }
    
    func scrollToFirstRow() {
        let indexPath = IndexPath(item: 0, section: 0)
        self.tblPlayerDetail.scrollToRow(at: indexPath, at: .top, animated: true)
    }
    
    private func selectFilter() {
        if self.arrayTeamsList.count > 0 {
            var reason: [String] = []
            for data in self.arrayTeamsList {
                reason.append("\(data)")
            }
            RPicker.selectOption(title: "Select Team", cancelText: "Cancel", dataArray: reason, selectedIndex: 0) {[weak self] (selctedText, atIndex) in
                self?.lblFilter.text = selctedText
                self?.arrayDisplayTeamName.removeAll()
                switch atIndex {
                case 0:
                    self?.arrayDisplayTeamName.append(self?.arrayPlayerDetail.values.first?.nameFull ?? "")
                    self?.arrayDisplayTeamName.append(self?.arrayPlayerDetail.values.reversed().first?.nameFull ?? "")
                    self?.filterPlayerDetails = (self?.firstTeamPlayerDetails ?? []) + (self?.secondTeamPlayerDetails ?? [])
                case 1:
                    self?.arrayDisplayTeamName.append(selctedText)
                    self?.filterPlayerDetails = self?.firstTeamPlayerDetails ?? []
                case 2:
                    self?.arrayDisplayTeamName.append(selctedText)
                    self?.filterPlayerDetails = self?.secondTeamPlayerDetails ?? []
                default:
                    break
                }
                self?.tblPlayerDetail.reloadData()
                self?.scrollToFirstRow()
            }
        }
    }
    
    //MARK: IBAction
    @IBAction func btnBackOnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnHidePlayerStylePopupOnAction(_ sender: Any) {
        viwPlayerStyle.isHidden = true
    }
    
    @IBAction func btnFilterOnAction(_ sender: Any) {
        selectFilter()
    }
}

//MARK: UITableViewDelegate, UITableViewDataSource
extension PlayerDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterPlayerDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerDetailCell", for: indexPath) as? PlayerDetailCell {
            cell.viwHeader.isHidden = true
            cell.lctViwHeaderHeightConst.constant = 0.0
            if indexPath.row == 0 || indexPath.row == 11 {
                cell.viwHeader.isHidden = false
                cell.lctViwHeaderHeightConst.constant = 40.0
                if indexPath.row == 0 {
                    cell.lblTeamName.text = arrayDisplayTeamName.first
                } else if indexPath.row == 11 {
                    cell.lblTeamName.text = arrayDisplayTeamName.last
                }
            }
            cell.selectionStyle = .none
            cell.lblPlyerName.text = "\(filterPlayerDetails[indexPath.row].nameFull)  \((filterPlayerDetails[indexPath.row].iscaptain ?? false) ? "(c)" : (filterPlayerDetails[indexPath.row].iskeeper ?? false) ? "(wk)" : "")"
            cell.lblPlayerBattingAvg.text = filterPlayerDetails[indexPath.row].batting.average
            cell.lblPlayerBowlingAvg.text = filterPlayerDetails[indexPath.row].bowling.average
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viwPlayerStyle.isHidden = false
        lblPlayerName.text = filterPlayerDetails[indexPath.row].nameFull
        lblPlayerBattingStyle.text = filterPlayerDetails[indexPath.row].batting.style
        lblPlayerBowlingStyle.text = filterPlayerDetails[indexPath.row].bowling.style
    }
    
}
