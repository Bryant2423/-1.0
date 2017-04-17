//
//  Area.swift
//  在路上
//
//  Created by Bryant on 2017/1/28.
//  Copyright © 2017年 Bryant. All rights reserved.
//

import Foundation

struct Area{
    var name:String
    var image:String
    var isVisted:Bool
    var part:String
    var province:String
    var rate = ""
    
    init(name: String, image: String, isVisted: Bool, part: String, province: String) {
        self.name = name
        self.image = image
        self.isVisted = isVisted
        self.part = part
        self.province = province
    }
}

