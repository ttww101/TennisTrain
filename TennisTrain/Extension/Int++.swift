//
//  Int++.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

extension Int {
    func toTimeString() -> (String, String) {
        var min = ""
        if Int(self / 60) < 10 {
            min = "0\(Int(self / 60))"
        } else {
            min = "\(Int(self / 60))"
        }
        var second = ""
        let s = self - (Int(self / 60) * 60)
        if s < 10 {
            second = "0\(s)"
        } else {
            second = "\(s)"
        }
        return (min, second)
    }
}
