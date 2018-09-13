//
//  ChannelCell.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/13/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {

    @IBOutlet weak var channelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        } else {
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(Channel: Channel) {
        let title = Channel.channelTitle ?? ""
        channelName.text = "#\(title)"
    }
}
