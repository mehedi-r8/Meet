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
        //guard let name = usernameTxt.text , usernameTxt.text != "" else { return }
        guard let email = emailTxt.text , emailTxt.text != "" else { return }
        guard let pass = passtxt.text , passtxt.text != "" else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                print("😍😍Awesome Registration Done😍😍")
            } else {
                print("😢😢cannot register😢😢")
            }
            
        }
    }
    
}
