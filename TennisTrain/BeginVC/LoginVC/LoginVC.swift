//
//  LoginVC.swift
//  BasketballTrain
//
//  Created by Apple on 7/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var accountTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func loginPressed(_ sender: UIButton) {
        if self.accountTF.text == "" || self.passwordTF.text == "" {
            self.customAlert("请输入资料")
            return
        } else {
            guard let account = self.accountTF.text,
                let password = self.passwordTF.text else { return }
            
            LCManager.shared.login(account, password) { (completion, message) in
                if completion {
//                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//                    UIApplication.shared.keyWindow?.rootViewController = storyboard.instantiateInitialViewController()
                    self.dismiss(animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(
                        title: "Error",
                        message: message,
                        preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
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
