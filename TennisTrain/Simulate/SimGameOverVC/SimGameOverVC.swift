//
//  SimGameOverVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimGameOverVC: UIViewController {
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    
    @IBOutlet weak var quarter11: UILabel!
    @IBOutlet weak var quarter12: UILabel!
    @IBOutlet weak var quarter13: UILabel!
    @IBOutlet weak var quarter14: UILabel!
    @IBOutlet weak var quarter15: UILabel!
    
    @IBOutlet weak var quarter21: UILabel!
    @IBOutlet weak var quarter22: UILabel!
    @IBOutlet weak var quarter23: UILabel!
    @IBOutlet weak var quarter24: UILabel!
    @IBOutlet weak var quarter25: UILabel!
    
    @IBOutlet weak var quarter4: UILabel!
    @IBOutlet weak var quarter5: UILabel!
    
    @IBOutlet weak var drop1: UILabel!
    @IBOutlet weak var drive1: UILabel!
    @IBOutlet weak var smash1: UILabel!
    @IBOutlet weak var out1: UILabel!
    
    @IBOutlet weak var drop2: UILabel!
    @IBOutlet weak var drive2: UILabel!
    @IBOutlet weak var smash2: UILabel!
    @IBOutlet weak var out2: UILabel!
    
    @IBOutlet weak var viewButton: NSLayoutConstraint!
    
    @IBOutlet weak var cornerView11: UIView!
    @IBOutlet weak var cornerView12: UIView!
    @IBOutlet weak var cornerView21: UIView!
    @IBOutlet weak var cornerView22: UIView!
    
    
    var ocArray: [UILabel] {
        return [quarter4, quarter5, quarter14, quarter15, quarter24, quarter25]
    }
    var homeArray: [UILabel] {
        return [quarter11, quarter12, quarter13, quarter14, quarter15]
    }
    var awayArray: [UILabel] {
        return [quarter21, quarter22, quarter23, quarter24, quarter25]
    }
    var other1Array: [UILabel] {
        return [drop1, drive1, smash1, out1]
    }
    var other2Array: [UILabel] {
        return [drop2, drive2, smash2, out2]
    }
    
    var proGRecordModel: ProGRecordModel!
    var openCell: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        setViewStyle()
        setLabelText()
        setLabelStyle()
    }
    func setViewStyle() {
        viewButton.constant = (openCell) ? 66 : 0
        if proGRecordModel.quarter == 3 {
            for i in 0..<ocArray.count {
                ocArray[i].isHidden = true
            }
        }
    }
    func setLabelText() {
        name1.text = proGRecordModel.team1.name
        name2.text = proGRecordModel.team2.name
        for i in 0..<homeArray.count {
            if proGRecordModel.team1.quarterArray[i] != proGRecordModel.team2.quarterArray[i] {
                homeArray[i].text = "\(proGRecordModel.team1.quarterArray[i])"
                awayArray[i].text = "\(proGRecordModel.team2.quarterArray[i])"
            }
        }
        for i in 0..<other1Array.count {
            other1Array[i].text = "\(proGRecordModel.team1.otherArray[i])"
            other2Array[i].text = "\(proGRecordModel.team2.otherArray[i])"
        }
    }
    func setLabelStyle() {
        if proGRecordModel.team1.score > proGRecordModel.team2.score {
            img1.image = UIImage(named: "iconWin")
            img2.image = UIImage(named: "iconFail")
        } else {
            img2.image = UIImage(named: "iconWin")
            img1.image = UIImage(named: "iconFail")
        }
        for i in 0..<homeArray.count {
            if proGRecordModel.team1.quarterArray[i] > proGRecordModel.team2.quarterArray[i] {
                homeArray[i].textColor = .red
            } else if proGRecordModel.team2.quarterArray[i] > proGRecordModel.team1.quarterArray[i] {
                awayArray[i].textColor = .red
            }
        }
    }

    @IBAction func savePressed(_ sender: UIButton) {
        if LCManager.shared.objectId != "" {
            LCManager.shared.saveGameRecord(self.proGRecordModel.team1, self.proGRecordModel.team2, self.proGRecordModel.quarter, completion: { (success, error) in
                self.dismiss(animated: true, completion: nil)
            })
        } else {
            let storyboard = UIStoryboard(name: "Begin", bundle: nil)
            if let desVC = storyboard.instantiateInitialViewController() {
                self.present(desVC, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
