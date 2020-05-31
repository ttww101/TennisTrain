//
//  SimPlayVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

struct SimPlayModel {
    var home: String
    var away: String
    var quarter: Int
    var win: Int
}

enum stopType {
    case homeStop, awayStop, rest
}

class SimPlayVC: UIViewController {
    @IBOutlet weak var homeName: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var homeGame: UILabel!
    @IBOutlet weak var homeQuarter1: UILabel!
    @IBOutlet weak var homeQuarter2: UILabel!
    @IBOutlet weak var homeQuarter3: UILabel!
    @IBOutlet weak var homeQuarter4: UILabel!
    @IBOutlet weak var homeQuarter5: UILabel!
    
    @IBOutlet weak var awayName: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var awayGame: UILabel!
    @IBOutlet weak var awayQuarter1: UILabel!
    @IBOutlet weak var awayQuarter2: UILabel!
    @IBOutlet weak var awayQuarter3: UILabel!
    @IBOutlet weak var awayQuarter4: UILabel!
    @IBOutlet weak var awayQuarter5: UILabel!
    
    @IBOutlet weak var gameStatus: UILabel!
    
    @IBOutlet weak var quarterL4: UILabel!
    @IBOutlet weak var quarterL5: UILabel!
    
    @IBOutlet weak var restView: UIView!
    @IBOutlet weak var restBtn: UIButton!
    @IBOutlet weak var restImg: UIImageView!
    
    @IBOutlet weak var cornerView1: UIView!
    @IBOutlet weak var cornerView2: UIView!
    
    
    var ocArray: [UILabel] {
        return [quarterL4, quarterL5, homeQuarter4, homeQuarter5, awayQuarter4, awayQuarter5]
    }
    var homeQuarArray: [UILabel] {
        return [homeQuarter1, homeQuarter2, homeQuarter3, homeQuarter4, homeQuarter5]
    }
    var awayQuarArray: [UILabel] {
        return [awayQuarter1, awayQuarter2, awayQuarter3, awayQuarter4, awayQuarter5]
    }
    
    var proGRecord: ProGRecordModel!
    var simPlayModel: SimPlayModel!
    var manager: SimPlayManager!
    var quarter = 1
    
    var fullGame1 = 0
    var fullGame2 = 0
    
    var game1 = 0 {
        didSet {
            homeGame.text = "\(game1)"
        }
    }
    var game2 = 0 {
        didSet {
            awayGame.text = "\(game2)"
        }
    }
    
    var scoreArray = ["0", "15", "30", "40"]
    var score1 = 0 {
        didSet {
            if getSeven() {
                homeScore.text = "\(score1)"
            } else {
                if score1 < 4 {
                    homeScore.text = scoreArray[score1]
                } else if score1 == 4 && score2 == 3 {
                    homeScore.text = "AD."
                }
            }
        }
    }
    var score2 = 0 {
        didSet {
            if getSeven() {
                awayScore.text = "\(score2)"
            } else {
                if score2 < 4 {
                    awayScore.text = scoreArray[score2]
                } else if score2 == 4 && score1 == 3 {
                    awayScore.text = "AD."
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if simPlayModel.quarter == 3 {
            for i in 0..<ocArray.count {
                ocArray[i].isHidden = true
            }
        }
        let team1 = teamRecordModel(name: simPlayModel.home, score: 0, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, quarter5: 0, Serve: 0, Slice: 0, Volley: 0, Out: 0)
        let team2 = teamRecordModel(name: simPlayModel.away, score: 0, quarter1: 0, quarter2: 0, quarter3: 0, quarter4: 0, quarter5: 0, Serve: 0, Slice: 0, Volley: 0, Out: 0)
        proGRecord = ProGRecordModel(team1: team1, team2: team2, quarter: simPlayModel.quarter)
        manager = SimPlayManager()
        restImg.loadGif(name: "cheerup")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setDefault()
    }
    
    func getSeven() -> Bool {
        if game1 == game2 && game1 == 6 {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Default
    func setDefault() {
        homeName.text = simPlayModel.home
        awayName.text = simPlayModel.away
        score1 = 0
        score2 = 0
        game1 = 0
        game2 = 0
        quarter = 1
    }
    
    // MARK: - Game
    func recordGame() {
        switch quarter {
        case 1:
            proGRecord.team1.quarter1 = game1
            proGRecord.team2.quarter1 = game2
        case 2:
            proGRecord.team1.quarter2 = game1
            proGRecord.team2.quarter2 = game2
        case 3:
            proGRecord.team1.quarter3 = game1
            proGRecord.team2.quarter3 = game2
        case 4:
            proGRecord.team1.quarter4 = game1
            proGRecord.team2.quarter4 = game2
        case 5:
            proGRecord.team1.quarter5 = game1
            proGRecord.team2.quarter5 = game2
        default:
            return
        }
        homeQuarArray[quarter - 1].text = "\(game1)"
        awayQuarArray[quarter - 1].text = "\(game2)"
        if manager.homequarter > manager.awayquarter {
            homeQuarArray[quarter - 1].textColor = .red
            awayQuarArray[quarter - 1].textColor = .lightGray
        } else {
            homeQuarArray[quarter - 1].textColor = .lightGray
            awayQuarArray[quarter - 1].textColor = .red
        }
        
        proGRecord.team1.Serve += manager.homeServe
        proGRecord.team1.Slice += manager.homeSlice
        proGRecord.team1.Volley += manager.homeVolley
        proGRecord.team1.Out += manager.homeOut
        proGRecord.team1.score = fullGame1
        
        proGRecord.team2.Serve += manager.awayServe
        proGRecord.team2.Slice += manager.awaySlice
        proGRecord.team2.Volley += manager.awayVolley
        proGRecord.team2.Out += manager.awayOut
        proGRecord.team2.score = fullGame2
        
        manager.reset()
    }
    func showStopView(_ type: stopType) {
        switch type {
        case .homeStop:
            restBtn.setTitle("主队暂停    结束", for: .normal)
        case .awayStop:
            restBtn.setTitle("客队暂停    结束", for: .normal)
        case .rest:
            restBtn.setTitle("中场休息    结束", for: .normal)
        }
        restView.isHidden = false
    }
    func scoreOver() {
        let j = (getSeven()) ? 6:3
        
        if score1 > j && score1 >= (score2 + 2) {
            game1 += 1
            score1 = 0
            score2 = 0
            gameOver()
        } else if score2 > j && score2 >= (score1 + 2) {
            game2 += 1
            score1 = 0
            score2 = 0
            gameOver()
        }
    }
    func gameOver() {
        if (game1 == 6 && game2 <= 4) || game1 == 7 {
            fullGame1 += 1
            recordGame()
            fullGameOver()
        } else if (game2 == 6 && game1 <= 4) || game2 == 7 {
            fullGame2 += 1
            recordGame()
            fullGameOver()
        }
    }
    func fullGameOver() {
        if fullGame1 == simPlayModel.win || fullGame2 == simPlayModel.win {
            let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let desVC = profileStoryboard.instantiateViewController(withIdentifier: "SimGameOverVC")
            
            guard let simGameOverVC = desVC as? SimGameOverVC else { return }
            
            simGameOverVC.proGRecordModel = proGRecord
            simGameOverVC.openCell = true
            
            self.present(simGameOverVC, animated: true) {
                self.navigationController?.popToRootViewController(animated: false)
            }
        } else {
            showStopView(.rest)
        }
    }
    
    func scoreADD(_ type: teamType) {
        switch type {
        case .home:
            if score1 == 3 && score2 == 4 && !getSeven() {
                score2 -= 1
            } else {
                score1 += 1
            }
        case .away:
            if score2 == 3 && score1 == 4 && !getSeven() {
                score1 -= 1
            } else {
                score2 += 1
            }
        default:
            return
        }
        
        if getSeven() && score1 == score2 && score1 > 5 {
            gameStatus.isHidden = false
        } else if !getSeven() && score1 == score2 && score1 == 3 {
            gameStatus.isHidden = false
        } else {
            gameStatus.isHidden = true
        }
    }

    // MARK: - UI Event
    @IBAction func addServePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .serve)
            scoreADD(.home)
        case 1:
            manager.addPoint(.away, .serve)
            scoreADD(.away)
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addSlicePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .slice)
            scoreADD(.home)
        case 1:
            manager.addPoint(.away, .slice)
            scoreADD(.away)
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addVolleyPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .volley)
            scoreADD(.home)
        case 1:
            manager.addPoint(.away, .volley)
            scoreADD(.away)
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func addOutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.addPoint(.home, .out)
            scoreADD(.away)
        case 1:
            manager.addPoint(.away, .out)
            scoreADD(.home)
        default:
            return
        }
        scoreOver()
    }
    
    @IBAction func minusServePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .serve) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .serve) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusSlicePressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .slice) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .slice) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusVolleyPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .volley) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .volley) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func minusOutPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            manager.minusPoint(.home, .out) {[weak self] (success) in
                if success { self?.score2 -= 1 }
            }
        case 1:
            manager.minusPoint(.away, .out) {[weak self] (success) in
                if success { self?.score1 -= 1 }
            }
        default:
            return
        }
    }
    
    @IBAction func restBtnPressed(_ sender: UIButton) {
        quarter += 1
        score1 = 0
        score2 = 0
        game1 = 0
        game2 = 0
        restView.isHidden = true
    }
}
