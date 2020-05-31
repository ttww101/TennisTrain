//
//  ProfileTrainVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileTrainVC: UIViewController {
    private let cellIdenfifier1 = String(describing: ProTrainTotalCell.self)
    private let cellIdenfifier2 = String(describing: ProTrainDetailCell.self)
    
    @IBOutlet weak var trainTable: UITableView!
    
    var allMin = 0
    var listData = [ProTrainModel]()
    let manager = ProTrainManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trainTable.dataSource = self
        trainTable.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getListData()
    }
    
    func getListData() {
        manager.getTrain {[weak self] (data, totalMin, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            self?.listData = data
            self?.allMin = totalMin
            self?.trainTable.reloadData()
        }
    }

}

extension ProfileTrainVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            
        case 0: return 1
        case 1: return listData.count
        default: return 0
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch indexPath.section {
            
        case 0:
            
            guard let cell = trainTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier1) as? ProTrainTotalCell
                else {return ProTrainTotalCell()}
            cell.totalMin.text = "\(self.allMin)"
            cell.totalTrain.text = "\(self.listData.count)"
            
            return cell
            
        case 1:
            let data = listData[index]
            guard let cell = trainTable.dequeueReusableCell(withIdentifier:
                cellIdenfifier2) as? ProTrainDetailCell
                else { return ProTrainDetailCell()}
            cell.trainImg.image = UIImage(named: data.img)
            cell.trainTitle.text = data.title
            cell.trainTime.text = "0\(data.time):00"
            cell.trainDate.text = data.date.convertProTrainCell()
            
            return cell
            
        default:
            
            break
            
        }
        return ProTrainTotalCell()
    }
}

extension ProfileTrainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        } else {
            return 150
        }
    }
}
