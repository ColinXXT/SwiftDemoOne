//
//  MessageViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 11/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit
//头部三个item
enum MineHeadViewButtonType: Int {
    case Order = 0
    case Coupon = 1
    case Message = 2
}

class MessageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HearderView
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 160))
        headerView.backgroundColor = UIColor.colorWithHexString("F0E68C")

        
        let userImage = UIImage(named: "v2_my_avatar")
        let settingImage = UIImage.init(named: "v2_my_settings_icon")
      
        
        let userBtn:UIButton = UIButton(type:.custom)
        let settingBtn : UIButton = UIButton.init(type: .custom)
        //设置按钮大小
        userBtn.frame.size = CGSize(width: 50, height: 50)
        settingBtn.frame.size = CGSize.init(width: 50, height: 50)
        //设置按钮文字
        userBtn.setImage(userImage, for: .normal)
        settingBtn.setImage(settingImage, for: .normal)
        userBtn.addTarget(self, action: #selector(userClick), for: .touchUpInside)
        userBtn.center = CGPoint.init(x: headerView.bounds.width / 2, y: headerView.bounds.size.height / 2)
        settingBtn.frame.origin.x = self.view.bounds.width - settingBtn.bounds.width
        settingBtn.addTarget(self, action: #selector(settingClick), for: .touchUpInside)
        
        
        let phoneNum = UILabel()
        phoneNum.frame.size = CGSize.init(width: headerView.bounds.size.width, height: 30)
        phoneNum.center = CGPoint.init(x: headerView.bounds.width / 2, y: headerView.bounds.height / 2 + 50)
        phoneNum.text = "18500950595"
        phoneNum.font = UIFont.boldSystemFont(ofSize: 18)
        phoneNum.textColor = UIColor.white
        phoneNum.textAlignment = .center

        
        //并列三个item
        //1 定义相关控件和方法

        let subItem = self.view.bounds.size.width / 3
        let orderViewHeader = UIView.init(frame: CGRect.init(x: 0, y: 160, width: subItem, height: 50))
        let cgItem = CGRect.init(x: 10, y: 10, width: subItem - 20, height: 30)
        var OrderBtn = UIButton.init()
        var couponBtn = UIButton.init()
        var messageBtn = UIButton.init()
        let couponViewHeader = UIView.init(frame: CGRect.init(x: subItem, y: 160, width: subItem, height: 50))
        let messageViewHeader = UIView.init(frame: CGRect.init(x: subItem * 2, y: 160, width: subItem, height: 50))
   
        OrderBtn = MineUpImageDownText(frame: cgItem, title: "我的订单", imageName: "v2_my_order_icon")
        couponBtn = MineUpImageDownText(frame: cgItem, title: "优惠劵", imageName: "v2_my_coupon_icon")
        messageBtn = MineUpImageDownText(frame: cgItem, title: "我的消息", imageName: "v2_my_message_icon")
        

        let line1 = UIView.init(frame: CGRect.init(x: subItem - 0.5, y: 160 + (50 * 0.2), width: 1, height: 50 * 0.6))
        line1.backgroundColor = UIColor.gray
        line1.alpha = 0.3
        let line2 = UIView.init(frame: CGRect.init(x: subItem * 2 - 0.5, y: 160 + (50 * 0.2), width: 1, height: 50 * 0.6))
        line2.backgroundColor = UIColor.gray
        line2.alpha = 0.3
        
        let bodyView = UIView.init(frame: CGRect.init(x: 0, y: 210, width: self.view.bounds.width, height: self.view.bounds.size.height - 210))
        bodyView.backgroundColor = UIColor.gray
        
      
        
        headerView.addSubview(userBtn)
        headerView.addSubview(settingBtn)
        headerView.addSubview(phoneNum)
        orderViewHeader.addSubview(OrderBtn)
        couponViewHeader.addSubview(couponBtn)
        messageViewHeader.addSubview(messageBtn)
        self.view.addSubview(headerView)
        self.view.addSubview(orderViewHeader)
        self.view.addSubview(couponViewHeader)
        self.view.addSubview(messageViewHeader)
        self.view.addSubview(line1)
        self.view.addSubview(line2)
        self.view.addSubview(bodyView)
        
    }
    @objc func userClick(){
        print("User Click")
    }
    
    @objc func settingClick(){
        print("Setting Click")
    }
}

class MineUpImageDownText: UIButton {
    
    init(frame: CGRect, title: String, imageName: String) {
        super.init(frame: frame)
        setTitle(title, for: .normal)
        setTitleColor(UIColor.colorWithRGB(r: 80, g: 80, b: 80, alpha: 1), for: .normal)
        setImage(UIImage(named: imageName), for: .normal)
        isUserInteractionEnabled = false
        titleLabel?.font = UIFont.systemFont(ofSize: 13)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



