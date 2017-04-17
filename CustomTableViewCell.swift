//
//  CustomTableViewCell.swift
//  在路上
//
//  Created by Bryant on 2017/1/23.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLable: UILabel!

    @IBOutlet weak var provinceLabel: UILabel! //省份
    
    @IBOutlet weak var partLabel: UILabel! //所在地区
    
    @IBOutlet weak var thumbImageView: UIImageView!
    
    
    @IBOutlet weak var like: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
