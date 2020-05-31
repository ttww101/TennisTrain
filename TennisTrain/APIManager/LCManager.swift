//
//  LCManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import LeanCloud

class LCManager {
    static let shared = LCManager()
    let userDefault = UserDefaults.standard
    var objectId = ""
    
    private init() {
        
    }
    
    func configure() {
        do {
            try LCApplication.default.set(
                id:  "1xnO8h8nhEVoijo8F7PEqIUC-gzGzoHsz",
                key: "vU8QBecfF21pUQdWSYEGBIq3"
            )
        } catch {
            print("")
        }
    }
    
    func createUser(username: String, account: String, password: String, completion: @escaping (Bool, String, Error?) -> Void) {
        let query = LCQuery(className: "userInfo")
        query.whereKey("account", .equalTo(account))
        if query.getFirst().object != nil {
            completion(false, "帐号重复", nil)
        } else {
            do {
                let todo = LCObject(className: "userInfo")
                try todo.set("account", value: account)
                try todo.set("password", value: password)
                try todo.set("username", value: username)
                let _ = todo.save {[weak self](result) in
                    switch result {
                    case .success:
                        self?.objectId = todo.objectId!.stringValue!
                        completion(true, "注册成功", nil)
                    case .failure(let error):
                        completion(false, "帐号重复", error)
                    }
                }
            } catch {
                // handle error
            }
        }
    }
    
    func login(_ account: String, _ password: String, completion: @escaping (Bool, String) -> Void) {
        let query = LCQuery(className: "userInfo")
        query.whereKey("account", .equalTo(account))
        query.whereKey("password", .equalTo(password))
        if let object = query.getFirst().object {
            self.objectId = object.objectId!.stringValue!
            completion(true, "登入成功")
        } else {
            completion(false, "帐号密码错误")
        }
    }
    
    func getUserName(completion: @escaping (String, Error?) -> Void) {
        do {
            let query = LCQuery(className: "userInfo")
            let _ = query.get(objectId) { (result) in
                switch result {
                case .success(object: let object):
                    // get value by string key
                    let name = object.get("username")?.stringValue
                    completion(name!, nil)
                case .failure(error: let error):
                    completion("", error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func saveActivity(_ title: String, _ img: String, _ time: Int, completion: @escaping (Bool, Error?) -> Void) {
        do {
            let todo = LCObject(className: "trainrecord")
            try todo.set("userid", value: objectId)
            try todo.set("trainTitle", value: title)
            try todo.set("trainMin", value: time)
            try todo.set("trainImg", value: img)
            let _ = todo.save {(result) in
                switch result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func getActivity(completion: @escaping (Result<[ProTrainModel], Error>) -> Void) {
        
        var proTrainArray = [ProTrainModel]()
        
        let cql = "select * from trainrecord where userid = '\(objectId)' order by created desc"
        
        _ = LCCQLClient.execute(cql) { result in
            switch result {
            case .success(let result):
                let todos = result.objects
                for iii in 0..<todos.count {
                    let title = todos[iii]["trainTitle"]?.stringValue
                    let min = todos[iii]["trainMin"]?.intValue
                    let img = todos[iii]["trainImg"]?.stringValue
                    let date = todos[iii]["createdAt"]?.dateValue
                    let item = ProTrainModel(title: title!, img: img!, date: date!, time: min!)
                    
                    proTrainArray.append(item)
                    
                }
                completion(Result.success(proTrainArray))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
    }
    
    func saveGameRecord(_ team1: teamRecordModel, _ team2: teamRecordModel, _ quarter: Int, completion: @escaping (Bool, Error?) -> Void) {
        do {
            let todo = LCObject(className: "gamerecord")
            try todo.set("userid", value: objectId)
            try todo.set("name1", value: team1.name)
            try todo.set("name2", value: team2.name)
            try todo.set("quarterCount", value: quarter)
            try todo.set("score1", value: team1.score)
            try todo.set("score2", value: team2.score)
            try todo.set("1quarter1", value: team1.quarter1)
            try todo.set("1quarter2", value: team1.quarter2)
            try todo.set("1quarter3", value: team1.quarter3)
            try todo.set("1quarter4", value: team1.quarter4)
            try todo.set("1quarter5", value: team1.quarter5)
            try todo.set("2quarter1", value: team2.quarter1)
            try todo.set("2quarter2", value: team2.quarter2)
            try todo.set("2quarter3", value: team2.quarter3)
            try todo.set("2quarter4", value: team2.quarter4)
            try todo.set("2quarter5", value: team2.quarter5)
            try todo.set("serve1", value: team1.Serve)
            try todo.set("serve2", value: team2.Serve)
            try todo.set("slice1", value: team1.Slice)
            try todo.set("slice2", value: team2.Slice)
            try todo.set("volley1", value: team1.Volley)
            try todo.set("volley2", value: team2.Volley)
            try todo.set("out1", value: team1.Out)
            try todo.set("out2", value: team2.Out)
            let _ = todo.save {(result) in
                switch result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
                }
            }
        } catch {
            // handle error
        }
    }
    
    func toArray(_ value: [LCArray.Element]) -> [LCValueConvertible] {
        let array = value.map { element in element }
        return array
    }
    
    func getGameRecord(completion: @escaping (Result<[ProGRecordModel], Error>) -> Void) {
        var proGReacordArray = [ProGRecordModel]()
        
        let cql = "select * from gamerecord where userid = '\(objectId)' order by created desc"
        
        _ = LCCQLClient.execute(cql) { result in
            switch result {
            case .success(let result):
                let todos = result.objects
                for iii in 0..<todos.count {
                    let teamname1 = todos[iii]["name1"]!.stringValue!
                    let teamname2 = todos[iii]["name2"]!.stringValue!
                    let quarterCount = todos[iii]["quarterCount"]!.intValue!
                    let team1 = teamRecordModel(
                        name: teamname1,
                        score: todos[iii]["score1"]!.intValue!,
                        quarter1: todos[iii]["1quarter1"]!.intValue!,
                        quarter2: todos[iii]["1quarter2"]!.intValue!,
                        quarter3: todos[iii]["1quarter3"]!.intValue!,
                        quarter4: todos[iii]["1quarter4"]!.intValue!,
                        quarter5: todos[iii]["1quarter5"]!.intValue!,
                        Serve: todos[iii]["serve1"]!.intValue!,
                        Slice: todos[iii]["slice1"]!.intValue!,
                        Volley: todos[iii]["volley1"]!.intValue!,
                        Out: todos[iii]["out1"]!.intValue!
                    )
                    let team2 = teamRecordModel(
                        name: teamname2,
                        score: todos[iii]["score2"]!.intValue!,
                        quarter1: todos[iii]["2quarter1"]!.intValue!,
                        quarter2: todos[iii]["2quarter2"]!.intValue!,
                        quarter3: todos[iii]["2quarter3"]!.intValue!,
                        quarter4: todos[iii]["2quarter4"]!.intValue!,
                        quarter5: todos[iii]["2quarter5"]!.intValue!,
                        Serve: todos[iii]["serve2"]!.intValue!,
                        Slice: todos[iii]["slice2"]!.intValue!,
                        Volley: todos[iii]["volley2"]!.intValue!,
                        Out: todos[iii]["out2"]!.intValue!
                    )
                    let item = ProGRecordModel(team1: team1, team2: team2, quarter: quarterCount)

                    proGReacordArray.append(item)
                    
                }
                completion(Result.success(proGReacordArray))
            case .failure(let error):
                completion(Result.failure(error))
            }
        }
        
    }
    
//    func getPrivacy(completion: @escaping (PrivacyModel?, Error?) -> Void) {
//        let query = LCQuery(className: "Privacy")
//        let _ = query.getFirst { (result) in
//            switch result {
//            case .success(object: let object):
//                // get value by string key
//                guard let title = object.get("title")?.stringValue else {
//                    completion(nil, nil)
//                    return
//                }
//                guard let privacy = object.get("privacy_address")?.stringValue else {
//                    completion(nil, nil)
//                    return
//                }
//                let beginModel = PrivacyModel(title: title, privacy: privacy)
//                completion(beginModel, nil)
//            case .failure(error: let error):
//                completion(nil, error)
//            }
//        }
//    }
}


