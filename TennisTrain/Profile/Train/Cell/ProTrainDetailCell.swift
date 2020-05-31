//
//  ProTrainDetailCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProTrainDetailCell: UITableViewCell {
    @IBOutlet weak var trainImg: UIImageView!
    @IBOutlet weak var trainTitle: UILabel!
    @IBOutlet weak var trainDate: UILabel!
    @IBOutlet weak var trainTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
