//
//  ClothTableViewCell.swift
//  TPE2SFO
//
//  Created by zip520123 on 2017/7/29.
//  Copyright © 2017年 zip520123. All rights reserved.
//

import UIKit

class ClothTableViewCell: UITableViewCell {

    
    @IBOutlet weak var clothImage: UIImageView!
    
    @IBOutlet weak var clothText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
