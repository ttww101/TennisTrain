//
//  SimPlayManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

enum teamType {
    case home, away
}

enum scoreType {
    case serve, slice, volley, out
}

class SimPlayManager {
    var homequarter = 0
    var homeServe = 0
    var homeSlice = 0
    var homeVolley = 0
    var homeOut = 0
    
    var awayquarter = 0
    var awayServe = 0
    var awaySlice = 0
    var awayVolley = 0
    var awayOut = 0
    
    init() {
        reset()
    }
    
    func reset() {
        homequarter = 0
        homeServe = 0
        homeSlice = 0
        homeVolley = 0
        homeOut = 0
        
        awayquarter = 0
        awayServe = 0
        awaySlice = 0
        awayVolley = 0
        awayOut = 0
    }
    
    func addPoint(_ team: teamType, _ score: scoreType) {
        switch team {
        case .home:
            switch score {
            case .serve:
                homeServe += 1
                homequarter += 1
            case .slice:
                homeSlice += 1
                homequarter += 1
            case .volley:
                homeVolley += 1
                homequarter += 1
            case .out:
                homeOut += 1
                awayquarter += 1
            }
        case .away:
            switch score {
            case .serve:
                awayServe += 1
                awayquarter += 1
            case .slice:
                awaySlice += 1
                awayquarter += 1
            case .volley:
                awayVolley += 1
                awayquarter += 1
            case .out:
                awayOut += 1
                homequarter += 1
            }
        }
    }
    
    func minusPoint(_ team: teamType, _ score: scoreType, _ completion: @escaping(Bool) -> Void) {
        switch team {
        case .home:
            switch score {
            case .serve:
                if homeServe > 0 {
                    homeServe -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .slice:
                if homeSlice > 0 {
                    homeSlice -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .volley:
                if homeVolley > 0 {
                    homeVolley -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if homeOut > 0 {
                    homeOut -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        case .away:
            switch score {
            case .serve:
                if awayServe > 0 {
                    awayServe -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .slice:
                if awaySlice > 0 {
                    awaySlice -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .volley:
                if awayVolley > 0 {
                    awayVolley -= 1
                    awayquarter -= 1
                    completion(true)
                } else { completion(false) }
            case .out:
                if awayOut > 0 {
                    awayOut -= 1
                    homequarter -= 1
                    completion(true)
                } else { completion(false) }
            }
        }
    }
    
}
