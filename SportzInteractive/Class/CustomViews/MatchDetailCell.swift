//
//  MatchDetailCell.swift
//  SportzInteractive
//
//  Created by Prakash.Vaghasiya on 10/28/22.
//

import UIKit

class MatchDetailCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var lblMatchVenue: UILabel!
    @IBOutlet weak var lblMatchTimeDate: UILabel!
    @IBOutlet weak var lblMatchTitle: UILabel!
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
