//
//  TrainListPlayCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TrainListPlayCell: UITableViewCell {
    
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var timeDescription: UILabel!
    @IBOutlet weak var actionDescription: UILabel!
    
    func updateView(actionModel: TrainActionModel) {
        
        progressView.isHidden = true
        
        timeDescription.text = String("\(Int(actionModel.timesDescription))秒")
        
        actionDescription.text = actionModel.actionDescription
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = #colorLiteral(red: 0.06666666667, green: 0.06666666667, blue: 0.06666666667, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
