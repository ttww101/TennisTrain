//
//  ProfileVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var indicatorLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trainView: UIView!
    @IBOutlet weak var gameRecordView: UIView!
    @IBOutlet weak var trainBtn: UIButton!
    @IBOutlet weak var gameRecordBtn: UIButton!
    @IBOutlet weak var loginView: UIView!
    
    var titleBtns: [UIButton] {
        return [trainBtn, gameRecordBtn]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if LCManager.shared.objectId != "" {
            getUserName()
            loginView.isHidden = true
        } else {
            loginView.isHidden = false
        }
    }
    
    func getUserName() {
        LCManager.shared.getUserName {[weak self] (name, error) in
            if error == nil {
                self?.userName.text = name
            }
        }
    }

    @IBAction func changePagePressed(_ sender: UIButton) {
        for btn in titleBtns {
            
            btn.isSelected = false
            
        }
        
        sender.isSelected = true
        
        moveIndicatorView(toPage: sender.tag)
        
    }
    
    private func moveIndicatorView(toPage: Int) {
        
        let screenWidth  = UIScreen.main.bounds.width
        
        indicatorLeadingConstraint.constant = CGFloat(toPage) * screenWidth / 2
        
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            
            self?.scrollView.contentOffset.x = CGFloat(toPage) * screenWidth
            
            self?.view.layoutIfNeeded()
            
        })
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let screenWidth  = UIScreen.main.bounds.width
        
        indicatorLeadingConstraint.constant = scrollView.contentOffset.x / 2
        
        let temp = Double(scrollView.contentOffset.x / screenWidth)
        
        let number = lround(temp)
        
        for btn in titleBtns {
            
            btn.isSelected = false
            
        }
        
        titleBtns[number].isSelected = true
        
        UIView.animate(withDuration: 0.1, animations: { [weak self] in
            
            self?.view.layoutIfNeeded()
            
        })
        
    }
    
    @IBAction func logoutPressed(_ sender: UIButton) {
        LCManager.shared.objectId = ""
        loginView.isHidden = false
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Begin", bundle: nil)
        if let desVC = storyboard.instantiateInitialViewController() {
            self.present(desVC, animated: true, completion: nil)
        }
    }
}
