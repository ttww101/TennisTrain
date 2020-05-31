//
//  LDatabase.swift
//  BasketballTrain
//
//  Created by Apple on 7/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class LDatabase {
    static let instance = LDatabase()
    private init() {}
    
    private let allArray = [
        TrainListModel(videoImg: "serve1", durationLbl: 5, videoTitle: "发球", videoDescription: "网球教学 『完全攻略』", intensity: "中等", videoID: "mUsYciyH7Dg", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 0, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "发球要点"),
            TrainActionModel(youtubeTime: 73, stopTime: 80, restTime: 3, timesDescription: 120, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 341, stopTime: 77, restTime: 3, timesDescription: 120, actionDescription: "动作练习")
            ]),
        TrainListModel(videoImg: "serve2", durationLbl: 6, videoTitle: "增加发球时速20公里", videoDescription: "改变你发球的训练方式 Pronation", intensity: "入门", videoID: "UMuzo0of33A", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 80, stopTime: 50, restTime: 3, timesDescription: 120, actionDescription: "手部练习"),
            TrainActionModel(youtubeTime: 131, stopTime: 34, restTime: 3, timesDescription: 60, actionDescription: "空挥拍练习"),
            TrainActionModel(youtubeTime: 168, stopTime: 48, restTime: 3, timesDescription: 60, actionDescription: "半挥拍练习"),
            TrainActionModel(youtubeTime: 217, stopTime: 78, restTime: 3, timesDescription: 120, actionDescription: "全挥拍动作Ｃ")
            ]),
        TrainListModel(videoImg: "serve3", durationLbl: 2, videoTitle: "网球发球", videoDescription: "如何发到想去的方向", intensity: "入门", videoID: "tQNcCC7ZFJs", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 28, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "右边发球"),
            TrainActionModel(youtubeTime: 92, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "左边发球")
            ]),
        TrainListModel(videoImg: "slice1", durationLbl: 2, videoTitle: "网球削球", videoDescription: "如何反手削球", intensity: "入门", videoID: "XQzFY-ieCcI", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 14, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 100, stopTime: 19, restTime: 3, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "slice2", durationLbl: 1, videoTitle: "网球底线反手削球", videoDescription: "网球教练苏浩刚", intensity: "入门", videoID: "mel4XHqCPF0", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 16, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "反手削球")
            ]),
        TrainListModel(videoImg: "slice3", durationLbl: 1, videoTitle: "单手反拍削球", videoDescription: "网球基础入门及实战技巧", intensity: "入门", videoID: "pxWcD0s7u-4", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 5, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "单手反拍削球")
            ]),
        TrainListModel(videoImg: "volley1", durationLbl: 4, videoTitle: "截击秘笈", videoDescription: "完全攻略教学", intensity: "入门", videoID: "z4gepueNHV8", category: .volley, actionModel: [
            TrainActionModel(youtubeTime: 29, stopTime: 40, restTime: 3, timesDescription: 40, actionDescription: "截击位置"),
            TrainActionModel(youtubeTime: 72, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "打法"),
            TrainActionModel(youtubeTime: 152, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "技巧"),
            TrainActionModel(youtubeTime: 304, stopTime: 40, restTime: 3, timesDescription: 80, actionDescription: "练习")
            ]),
        TrainListModel(videoImg: "volley2", durationLbl: 5, videoTitle: "网球截击", videoDescription: "完全攻略技术", intensity: "入门", videoID: "4QgoHtkXe3c", category: .volley, actionModel: [
            TrainActionModel(youtubeTime: 34, stopTime: 86, restTime: 3, timesDescription: 120, actionDescription: "握拍"),
            TrainActionModel(youtubeTime: 125, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "拍面"),
            TrainActionModel(youtubeTime: 204, stopTime: 50, restTime: 3, timesDescription: 120, actionDescription: "自我训练")
            ])
    ]
    
    private let serveArray = [
        TrainListModel(videoImg: "serve1", durationLbl: 5, videoTitle: "发球", videoDescription: "网球教学 『完全攻略』", intensity: "中等", videoID: "mUsYciyH7Dg", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 0, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "发球要点"),
            TrainActionModel(youtubeTime: 73, stopTime: 80, restTime: 3, timesDescription: 120, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 341, stopTime: 77, restTime: 3, timesDescription: 120, actionDescription: "动作练习")
            ]),
        TrainListModel(videoImg: "serve2", durationLbl: 6, videoTitle: "增加发球时速20公里", videoDescription: "改变你发球的训练方式 Pronation", intensity: "入门", videoID: "UMuzo0of33A", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 80, stopTime: 50, restTime: 3, timesDescription: 120, actionDescription: "手部练习"),
            TrainActionModel(youtubeTime: 131, stopTime: 34, restTime: 3, timesDescription: 60, actionDescription: "空挥拍练习"),
            TrainActionModel(youtubeTime: 168, stopTime: 48, restTime: 3, timesDescription: 60, actionDescription: "半挥拍练习"),
            TrainActionModel(youtubeTime: 217, stopTime: 78, restTime: 3, timesDescription: 120, actionDescription: "全挥拍动作Ｃ")
            ]),
        TrainListModel(videoImg: "serve3", durationLbl: 2, videoTitle: "网球发球", videoDescription: "如何发到想去的方向", intensity: "入门", videoID: "tQNcCC7ZFJs", category: .serve, actionModel: [
            TrainActionModel(youtubeTime: 28, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "右边发球"),
            TrainActionModel(youtubeTime: 92, stopTime: 45, restTime: 3, timesDescription: 60, actionDescription: "左边发球")
            ])
    ]
    
    private let sliceArray = [
        TrainListModel(videoImg: "slice1", durationLbl: 2, videoTitle: "网球削球", videoDescription: "如何反手削球", intensity: "入门", videoID: "XQzFY-ieCcI", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 14, stopTime: 60, restTime: 2, timesDescription: 60, actionDescription: "动作解析"),
            TrainActionModel(youtubeTime: 100, stopTime: 19, restTime: 3, timesDescription: 60, actionDescription: "连续动作")
            ]),
        TrainListModel(videoImg: "slice2", durationLbl: 1, videoTitle: "网球底线反手削球", videoDescription: "网球教练苏浩刚", intensity: "入门", videoID: "mel4XHqCPF0", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 16, stopTime: 30, restTime: 3, timesDescription: 60, actionDescription: "反手削球")
            ]),
        TrainListModel(videoImg: "slice3", durationLbl: 1, videoTitle: "单手反拍削球", videoDescription: "网球基础入门及实战技巧", intensity: "入门", videoID: "pxWcD0s7u-4", category: .slice, actionModel: [
            TrainActionModel(youtubeTime: 5, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "单手反拍削球")
            ])
    ]
    
    private let volleyArray = [
        TrainListModel(videoImg: "volley1", durationLbl: 4, videoTitle: "截击秘笈", videoDescription: "完全攻略教学", intensity: "入门", videoID: "z4gepueNHV8", category: .volley, actionModel: [
            TrainActionModel(youtubeTime: 29, stopTime: 40, restTime: 3, timesDescription: 40, actionDescription: "截击位置"),
            TrainActionModel(youtubeTime: 72, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "打法"),
            TrainActionModel(youtubeTime: 152, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "技巧"),
            TrainActionModel(youtubeTime: 304, stopTime: 40, restTime: 3, timesDescription: 80, actionDescription: "练习")
            ]),
        TrainListModel(videoImg: "volley2", durationLbl: 5, videoTitle: "网球截击", videoDescription: "完全攻略技术", intensity: "入门", videoID: "4QgoHtkXe3c", category: .volley, actionModel: [
            TrainActionModel(youtubeTime: 34, stopTime: 86, restTime: 3, timesDescription: 120, actionDescription: "握拍"),
            TrainActionModel(youtubeTime: 125, stopTime: 60, restTime: 3, timesDescription: 60, actionDescription: "拍面"),
            TrainActionModel(youtubeTime: 204, stopTime: 50, restTime: 3, timesDescription: 120, actionDescription: "自我训练")
            ])
    ]
    
    func getData(_ type: Int) -> [TrainListModel] {
        switch type {
        case 0:
            return allArray
        case 1:
            return serveArray
        case 2:
            return sliceArray
        case 3:
            return volleyArray
        default:
            return allArray
        }
    }
}
