//
//  RightTableModel.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 15/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class RightTableModel: NSObject {
    //商品名称
    var name : String
    //商品图片
    var picture : String
    //商品价格
    var price : Float
    
    init(name: String, picture: String, price: Float) {
        self.name = name
        self.picture = picture
        self.price = price
    }
    
}
