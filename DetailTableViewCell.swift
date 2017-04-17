//
//  DetailTableViewCell.swift
//  在路上
//
//  Created by Bryant on 2017/1/29.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var valueLable: UILabel!
    @IBOutlet weak var fieldLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
