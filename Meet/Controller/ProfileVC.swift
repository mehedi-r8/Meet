//
//  ProfileVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/12/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

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
        profileImg.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func logoutBtnPressed(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
}
