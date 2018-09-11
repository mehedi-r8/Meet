//
//  CreateAccountVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/11/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passtxt: UITextField!
    @IBOutlet weak var userImg: UIImageView!
    
    // Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func choseAvaterBtnPressed(_ sender: Any) {
    }
    
    @IBAction func changeBacgroundBtnPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passtxt.text , passtxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("😍😍Awesome Registration Done😍😍")
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("😍😍Awesome \(email) login Done😍😍")
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print("😍😍Awesome create user Done😍😍")
                                
                            } else{
                                print("☹️ create user error")
                            }
                        })
                    } else {
                        print("☹️login error")
                    }
                })
                
            } else {
                print("😢😢cannot register😢😢")
            }
        }
    }
    
}
