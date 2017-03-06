//
//  FeedCell.swift
//  snapChatProject
//
//  Created by Gus Silva on 3/5/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var readStatusIndicator: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
