//
//  StarCell.swift
//  GithubDemo
//
//  Created by Abhijeet Chakrabarti on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class StarCell: UITableViewCell {

    @IBOutlet weak var starLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
