//
//  TrainModel.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

struct TrainModel: Codable {
    
    private(set) public var secondTitle: String!
    private(set) public var title: String!
    private(set) public var imageName: String!
    
    init(title: String, imageName: String, secondTitle: String) {
        
        self.title = title
        self.imageName = imageName
        self.secondTitle = secondTitle
        
    }
    
}

struct TrainListModel {
    
    private(set) public var videoImg: String
    private(set) public var durationLbl: Int
    private(set) public var videoTitle: String
    private(set) public var videoDescription: String
    private(set) public var videoID: String
    private(set) public var intensity: String
    private(set) public var category: TrainType
    private(set) public var actionModel: [TrainActionModel]
    
    init(videoImg: String,
         durationLbl: Int,
         videoTitle: String,
         videoDescription: String,
         intensity: String,
         videoID: String,
         category: TrainType,
         actionModel: [TrainActionModel]
        ) {
        
        self.videoImg = videoImg
        self.durationLbl = durationLbl
        self.videoTitle = videoTitle
        self.videoDescription = videoDescription
        self.intensity = intensity
        self.actionModel = actionModel
        self.videoID = videoID
        self.category = category
    }
    
}

struct TrainActionModel: Equatable {
    
    private(set) public var youtubeTime: Double
    private(set) public var stopTime: Double
    private(set) public var timesDescription: Double
    private(set) public var actionDescription: String
    private(set) public var restTime: Double
    public var cellStatus: CellPlay
    public var actionOrRest: ActionOnOff
    public var playingOrPause: PlayingOnOff
    public var firstPlayAction: Bool = true
    public var firstPlayRest: Bool = true
    public var actionCellDidInvisiable: Bool = false
    public var restCellDidInvisiable: Bool = false
    
    init(youtubeTime: Double,
         stopTime: Double,
         restTime: Double,
         timesDescription: Double,
         actionDescription: String,
         cellStatus: CellPlay = CellPlay.willplay,
         actionOrRest: ActionOnOff = ActionOnOff.action,
         playingOrPause: PlayingOnOff = PlayingOnOff.playing,
         firstPlayAction: Bool = true,
         firstPlayRest: Bool = true,
         actionCellDidInvisiable: Bool = false,
         restCellDidInvisiable: Bool = false) {
        
        self.youtubeTime = youtubeTime
        self.stopTime = stopTime
        self.timesDescription = timesDescription
        self.actionDescription = actionDescription
        self.restTime = restTime
        self.cellStatus = cellStatus
        self.actionOrRest = actionOrRest
        self.playingOrPause = playingOrPause
        self.firstPlayAction = firstPlayAction
        self.firstPlayRest = firstPlayRest
        self.actionCellDidInvisiable = actionCellDidInvisiable
        self.restCellDidInvisiable = restCellDidInvisiable
    }
    
}
