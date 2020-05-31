//
//  TrainCell.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TrainCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var trainImg: UIImageView!
    @IBOutlet weak var secondTitle: UILabel!
    @IBOutlet weak var title: UILabel!
    
    func updataViews(model: TrainCellModel) {
        
        trainImg.image = UIImage(named: model.imageName)
        
        title.text = model.title
        
        secondTitle.text = model.subTitle
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        trainImg.clipsToBounds = true
        
        trainImg.layer.cornerRadius = 15
        
        bgView.backgroundColor = UIColor.blue
        bgView.clipsToBounds = true
        bgView.layer.masksToBounds = false
        bgView.layer.cornerRadius = 15
        
        bgView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        bgView.layer.shadowOffset = CGSize.zero
        bgView.layer.shadowOpacity = 0.4
        
        contentView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
