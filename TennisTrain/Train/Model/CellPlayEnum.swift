//
//  CellPlayEnum.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum CellPlay: String, Codable {
    
    case played
    case playing
    case willplay
    
}

enum ActionOnOff: String, Codable {
    
    case action
    case rest
}

enum PlayingOnOff: String, Codable {
    
    case playing
    case pause
    
}

enum EffectSound: String, Codable {
    
    case open
    case close
    
}

enum TrainType: String, Codable {
    case all
    case serve
    case slice
    case volley
}
