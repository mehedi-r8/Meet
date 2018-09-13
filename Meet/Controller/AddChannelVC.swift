//
//  AddChannelVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/13/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var ChannelDescription: UITextField!
    @IBOutlet weak var addChannelView: GradientView!
    @IBOutlet weak var bgView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtnPressed(_ sender: Any) {
        
    }
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(profileVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        addChannelView.layer.cornerRadius = 20
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
