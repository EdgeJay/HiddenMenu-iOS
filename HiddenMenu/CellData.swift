//
//  CellData.swift
//  HiddenMenu
//
//  Created by Wu Huijie on 4/11/15.
//  Copyright © 2015 EdgeJay. All rights reserved.
//

import UIKit

class CellData {
    var title: String
    var color: UIColor
    
    init(title: String = "", color: UIColor = UIColor.blackColor()) {
        self.title = title
        self.color = color
    }
}