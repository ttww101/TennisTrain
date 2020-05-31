//
//  ProTrainManager.swift
//  BasketballTrain
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import LeanCloud

class ProTrainManager {
    
    
    init() {
        
    }
    
    func getTrain(completion: @escaping ([ProTrainModel]?, Int, Error?) -> Void) {
        LCManager.shared.getActivity { (result) in
            switch result {
                
            case .success(let result):
                var totalMin = 0
                for i in 0..<result.count {
                    totalMin += result[i].time
                }
                completion(result, totalMin, nil)
            case .failure(let error):
                
                completion(nil, 0, error)
                
            }
        }
    }
}
