//
//  MessageShowBtnImage.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 17/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class MessageShowBtnImage: UIButton {
    
    public var label_title = UILabel()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        label_title.frame = CGRect(x:0,y:self.frame.size.height - 18,width:self.frame.size.width,height:18)
        label_title.backgroundColor = UIColor.lightGray
        label_title.textAlignment = .left
        self.addSubview(label_title)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
