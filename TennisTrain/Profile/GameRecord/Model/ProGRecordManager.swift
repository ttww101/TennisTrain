//
//  ProGRecordManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class ProGRecordManager {
    init() {
        
    }
    
    func getGameRecord(completion: @escaping ([ProGRecordModel]?, Error?) -> Void) {
        LCManager.shared.getGameRecord { (result) in
            switch result {
                
            case .success(let result):
                completion(result, nil)
            case .failure(let error):
                
                completion(nil, error)
                
            }
        }
    }
}
