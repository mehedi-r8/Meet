//
//  ChannelVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/11/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(Segue: UIStoryboardSegue){}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60

    }
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    

}
