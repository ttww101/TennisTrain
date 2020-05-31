//
//  SimSettingVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SimSettingVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var homeTF: UITextField!
    @IBOutlet weak var awayTF: UITextField!
    
    var homeName = "主队"
    var awayName = "客队"
    var quarter = 3
    var win = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTF.delegate = self
        awayTF.delegate = self

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let desVC = segue.destination as? SimPlayVC {
            if let name = homeTF.text {
                if name != "" { homeName = name }
            }
            if let name = awayTF.text {
                if name != "" { awayName = name }
            }
            desVC.simPlayModel = SimPlayModel(home: homeName, away: awayName, quarter: quarter, win: win)
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    @IBAction func quarterChange(_ sender: UISegmentedControl) {
        quarter = 3 + (sender.selectedSegmentIndex * 2)
        win = 2 + sender.selectedSegmentIndex
    }
}
