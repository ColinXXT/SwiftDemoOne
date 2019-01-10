//
//  FoodViewMode.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 10/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class FoodViewMode: NSObject {
    var id: String
    var images: String
    var title: String
    var date: NSDate
    
    init(id: String, images:String, title: String, date: NSDate) {
        self.id = id
        self.images = images
        self.title = title
        self.date = date
    }
    
}
