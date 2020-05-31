//
//  TrainCellModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct TrainCellModel {
    
    let imageName: String
    let title: String
    let subTitle: String
    
    init(category: TrainModel) {
        
        self.imageName = category.imageName
        self.title = category.title
        self.subTitle = category.secondTitle
        
    }
    
}
