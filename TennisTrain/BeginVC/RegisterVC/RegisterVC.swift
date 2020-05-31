//
//  RegisterVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func registerPressed(_ sender: UIButton) {
        if self.userTF.text == "" || self.accountTF.text == "" || self.passwordTF.text == "" {
            self.customAlert("请输入资料")
            return
        } else {
            guard let userName = self.userTF.text,
                let account = self.accountTF.text,
                let password = self.passwordTF.text else { return }
            
            LCManager.shared.createUser(username: userName, account: account, password: password) { (completion, message, error) in
                if completion {
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.customAlert(message)
                    return
                }
            }
            
        }
    }
    
    func customAlert(_ message: String) {
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "OK", style: .default) { (_) in
            alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}
