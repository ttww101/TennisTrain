//
//  TrainListCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TrainListCell: UITableViewCell {
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var videoDescription: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var intensityLbl: UILabel!
    
    func updateView(listModel: TrainListModel) {
        
        videoImg.image = UIImage(named: listModel.videoImg)
        
        videoTitle.text = listModel.videoTitle
        
        videoDescription.text = listModel.videoDescription
        
        durationLbl.text = "\(listModel.durationLbl)min"
        
        intensityLbl.text = listModel.intensity
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
