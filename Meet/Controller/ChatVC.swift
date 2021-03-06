//
//  ChatVC.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/11/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit
import SocketIO

class ChatVC: UIViewController {

    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channnelnameLbl: UILabel!
    @IBOutlet weak var MessageTextBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.KeyboardBind()
        hideKeyboard()
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    //Handle Keyboard
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channnelnameLbl.text = "Please Log In"
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.channelTitle ?? ""
        channnelnameLbl.text = "\(channelName)"
        getMessage()
    }
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannel { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channnelnameLbl.text = "No Channel Yet"
                }
            }
        }
    }
    
    
    func getMessage() {
        guard let channelId = MessageService.instance.selectedChannel?.id else {
            return
        }
        MessageService.instance.findAllMessageForChannel(channelId: channelId) { (success) in
            
        }
    }
    
    
    
    @IBAction func sendBtn(_ sender: Any) {
        
    }
}
