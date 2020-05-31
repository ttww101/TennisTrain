//
//  ScoreVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {
    
    var listData: TrainListModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func finishPressed(_ sender: UIButton) {
        if LCManager.shared.objectId != "" {
            LCManager.shared.saveActivity(listData.videoTitle, listData.videoImg, listData.durationLbl) { (completion, error) in
                self.navigationController?.popToRootViewController(animated: true)
            }
        } else {
            let storyboard = UIStoryboard(name: "Begin", bundle: nil)
            if let desVC = storyboard.instantiateInitialViewController() {
                self.present(desVC, animated: true, completion: nil)
            }
            
        }

    }
    

}
