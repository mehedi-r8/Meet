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
        guard let channelName = nameTxt.text , nameTxt.text != "" else {
            return
        }
        guard let channelDescription = ChannelDescription.text, ChannelDescription.text != "" else {
            return
        }
        SocketService.instance.addChannel(channelName: channelName, channelDescription: channelDescription) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("addddddddddddddddddddddd")
            } else {
                print("\n\nerror\n\n")
            }
        }
    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        nameTxt.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedString.Key.foregroundColor : purplePlaceholder])
        ChannelDescription.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedString.Key.foregroundColor : purplePlaceholder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
