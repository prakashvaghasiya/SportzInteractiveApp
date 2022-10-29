//
//  PlayerDetailCell.swift
//  SportzInteractive
//
//  Created by Prakash.Vaghasiya on 10/28/22.
//

import UIKit

class PlayerDetailCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var lctViwHeaderHeightConst: NSLayoutConstraint!
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var lblPlayerBowlingAvg: UILabel!
    @IBOutlet weak var lblPlayerBattingAvg: UILabel!
    @IBOutlet weak var lblPlyerName: UILabel!
    @IBOutlet weak var viwHeader: UIView!
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
