//
//  profileVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/12/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class profileVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var profileView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
 
    @IBAction func closebtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupView() {
        username.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileImg.image = UIImage(named: UserDataService.instance.avatarName)
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(componets: UserDataService.instance.avatarColor)
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(profileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        profileView.layer.cornerRadius = 15
        
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIFICATION_USER_DATA_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
