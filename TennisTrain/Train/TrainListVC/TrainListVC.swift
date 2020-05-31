//
//  TrainListVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class TrainListVC: UIViewController {
    let cellIdenfifier = String(describing: TrainListCell.self)
    @IBOutlet weak var listTableView: UITableView!
    
    var listData = [TrainListModel]()
    var listActions = [TrainActionModel]()
    var selectSender = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listTableView.delegate = self
        listTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}

extension TrainListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = listTableView.dequeueReusableCell(withIdentifier: cellIdenfifier) as? TrainListCell {
            
            let list = listData[indexPath.row]
            cell.updateView(listModel: list)
            cell.selectionStyle = .none
            return cell
            
        } else {
            
            return TrainListCell()
            
        }
    }
}

extension TrainListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1.0
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        //actions = lists[index].actionModel
        listActions = listData[index].actionModel
        selectSender = index
        
        let topIndex = IndexPath(row: 0, section: 0)
        listTableView.scrollToRow(at: topIndex, at: UITableView.ScrollPosition.top, animated: false)
        
        performSegue(withIdentifier: "toTrainListPlay", sender: listActions)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let actionVC = segue.destination as? TrainListPlayVC {
            
            actionVC.lists = self.listData
            actionVC.actionLists = self.listActions
            actionVC.selectSender = self.selectSender
            
        }
        
    }
}
