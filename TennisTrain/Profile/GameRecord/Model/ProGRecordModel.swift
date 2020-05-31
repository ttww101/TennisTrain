//
//  ProGRecordModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct ProGRecordModel {
    var team1: teamRecordModel
    var team2: teamRecordModel
    var quarter: Int
}

struct teamRecordModel {
    var name: String
    var score: Int
    var quarter1: Int
    var quarter2: Int
    var quarter3: Int
    var quarter4: Int
    var quarter5: Int
    var Serve: Int
    var Slice: Int
    var Volley: Int
    var Out: Int
    var quarterArray: [Int] {
        return [quarter1, quarter2, quarter3, quarter4, quarter5]
    }
    var otherArray: [Int] {
        return [Serve, Slice, Volley, Out]
    }
}
