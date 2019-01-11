//
//  LoginViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 11/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    //用户密码输入框
    var txtUser:UITextField!
    var txtPwd:UITextField!
    var submitButton:UIButton!
    
    //左手离脑袋的距离
    var offsetLeftHand:CGFloat = 60
    
    //左手图片,右手图片(遮眼睛的)
    var imgLeftHand:UIImageView!
    var imgRightHand:UIImageView!
    
    //左手图片,右手图片(圆形的)
    var imgLeftHandGone:UIImageView!
    var imgRightHandGone:UIImageView!
    
    //登录框状态
    var showType:LoginShowType = LoginShowType.NONE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取屏幕尺寸
        let mainSize = UIScreen.main.bounds.size
        
        //猫头鹰头部
        let imgLogin = UIImageView.init(frame: CGRect.init(x: mainSize.width / 2 - 211 / 2, y: 100, width: 211, height: 109))
        imgLogin.image = UIImage(named:"owl-login")
        imgLogin.layer.masksToBounds = true
        self.view.addSubview(imgLogin)
        
        //猫头鹰左手(遮眼睛的)
        let rectLeftHand = CGRect.init(x: 61 - offsetLeftHand, y: 90, width: 40, height: 65)
        imgLeftHand = UIImageView(frame:rectLeftHand)
        imgLeftHand.image = UIImage(named:"owl-login-arm-left")
        imgLogin.addSubview(imgLeftHand)
        
        //猫头鹰右手(遮眼睛的)
        let rectRightHand = CGRect.init(x: imgLogin.frame.size.width / 2 + 60, y: 90, width: 40, height: 65)
        imgRightHand = UIImageView(frame:rectRightHand)
        imgRightHand.image = UIImage(named:"owl-login-arm-right")
        imgLogin.addSubview(imgRightHand)
        
        //登录框背景
        let vLogin = UIView.init(frame: CGRect.init(x: 15, y: 200, width: mainSize.width - 30, height: 160))
        vLogin.layer.borderWidth = 0.5
        vLogin.layer.borderColor = UIColor.lightGray.cgColor
        vLogin.backgroundColor = UIColor.white
        self.view.addSubview(vLogin)
        
        //猫头鹰左手(圆形的)
        let rectLeftHandGone = CGRect.init(x: mainSize.width / 2 - 100, y: vLogin.frame.origin.y - 22, width: 40, height: 40)
        imgLeftHandGone = UIImageView(frame:rectLeftHandGone)
        imgLeftHandGone.image = UIImage(named:"icon_hand")
        self.view.addSubview(imgLeftHandGone)
        
        //猫头鹰右手(圆形的)
        let rectRightHandGone = CGRect.init(x: mainSize.width / 2 + 62, y: vLogin.frame.origin.y - 22, width: 40, height: 40)
        imgRightHandGone = UIImageView(frame:rectRightHandGone)
        imgRightHandGone.image = UIImage(named:"icon_hand")
        self.view.addSubview(imgRightHandGone)
        
        //用户名输入框
        txtUser = UITextField.init(frame: CGRect.init(x: 30, y: 40, width: vLogin.frame.size.width - 60, height: 44))
        txtUser.delegate = self
        txtUser.layer.cornerRadius = 5
        txtUser.layer.borderColor = UIColor.lightGray.cgColor
        txtUser.layer.borderWidth = 0.5
        txtUser.leftView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        txtUser.leftViewMode = UITextFieldViewMode.always
        
        //用户名输入框左侧图标
        let imgUser = UIImageView.init(frame:CGRect.init(x: 11, y: 11, width: 22, height: 22))
        imgUser.image = UIImage(named:"iconfont-user")
        txtUser.leftView!.addSubview(imgUser)
        vLogin.addSubview(txtUser)
        
        //密码输入框
        txtPwd = UITextField.init(frame: CGRect.init(x: 30, y: 90, width: vLogin.frame.size.width-60, height: 44))
        txtPwd.delegate = self
        txtPwd.layer.cornerRadius = 5
        txtPwd.layer.borderColor = UIColor.lightGray.cgColor
        txtPwd.layer.borderWidth = 0.5
        txtPwd.isSecureTextEntry = true
        txtPwd.leftView = UIView(frame:CGRect.init(x: 30, y: 120, width: 44, height: 44))
        txtPwd.leftViewMode = UITextFieldViewMode.always
        
        //密码输入框左侧图标
        let imgPwd =  UIImageView.init(frame: CGRect.init(x: 11, y: 11, width: 22, height: 22))
        imgPwd.image = UIImage(named:"iconfont-password")
        txtPwd.leftView!.addSubview(imgPwd)
        vLogin.addSubview(txtPwd)
        
        //提交按钮
        submitButton = UIButton.init(type: UIButtonType.custom)
        submitButton.frame = CGRect.init(x: 0, y: 200, width: mainSize.width - 30, height: 50)
        submitButton.setTitle("登录", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        //字体
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        //设置圆角
        submitButton.layer.masksToBounds = true
        submitButton.layer.cornerRadius = 5.0
        //设置边框
        submitButton.layer.borderColor = UIColor.colorWithHexString("21d1c1").cgColor
        submitButton.layer.backgroundColor = UIColor.colorWithHexString("21d1c1").cgColor
        submitButton.layer.borderWidth = 1.5
        submitButton.addTarget(self, action: #selector(loginBtbClick), for: .touchUpInside)
        vLogin.addSubview(submitButton)
    }
    
    //输入框获取焦点开始编辑
    func textFieldDidBeginEditing(_ textField:UITextField)
    {
        //如果当前是用户名输入
        if textField.isEqual(txtUser){
            if (showType != LoginShowType.PASS)
            {
                showType = LoginShowType.USER
                return
            }
            showType = LoginShowType.USER
            
            //播放不遮眼动画
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
            
            self.imgLeftHand.frame = CGRect.init(x: self.imgLeftHand.frame.origin.x - self.offsetLeftHand, y: self.imgLeftHand.frame.origin.y + 30, width: self.imgLeftHand.frame.size.width, height: self.imgLeftHand.frame.size.height)
            self.imgRightHand.frame = CGRect.init(x: self.imgRightHand.frame.origin.x + 48, y: self.imgLeftHand.frame.origin.y + 30, width: self.imgLeftHand.frame.size.width, height: self.imgLeftHand.frame.size.height)
            self.imgLeftHandGone.frame = CGRect.init(x: self.imgRightHand.frame.origin.x - 70, y: self.imgLeftHand.frame.origin.y, width: 40, height: 40)
            self.imgRightHandGone.frame = CGRect.init(x: self.imgRightHand.frame.origin.x + 30, y: self.imgLeftHand.frame.origin.y, width: 40, height: 40)
            })
            
        }
            
            //如果当前是密码名输入
        else if textField.isEqual(txtPwd){
            if (showType == LoginShowType.PASS)
            {
                showType = LoginShowType.PASS
                return
            }
            showType = LoginShowType.PASS
            
            //播放遮眼动画
            UIView.animate(withDuration: 0.5, animations: { () -> Void in
            self.imgLeftHand.frame = CGRect.init(x: self.imgLeftHand.frame.origin.x + self.offsetLeftHand, y: self.imgLeftHand.frame.origin.y - 30, width: self.imgLeftHand.frame.size.width, height: self.imgLeftHand.frame.size.height)
            self.imgRightHand.frame = CGRect.init(x: self.imgRightHand.frame.origin.x - 48, y: self.imgLeftHand.frame.origin.y - 30, width: self.imgLeftHand.frame.size.width, height: self.imgLeftHand.frame.size.height)
            self.imgLeftHandGone.frame = CGRect.init(x: self.imgRightHand.frame.origin.x + 70, y: self.imgLeftHand.frame.origin.y, width: 0, height: 0)
            self.imgRightHandGone.frame = CGRect.init(x: self.imgRightHand.frame.origin.x - 30, y: self.imgLeftHand.frame.origin.y, width: 0, height: 0)
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func loginBtbClick(button:UIButton ){
        button.isSelected = !button.isSelected
        if button.isSelected {
            button.setTitle("Selected", for: .normal)
        }else{
            button.setTitle("NoSelected", for: .normal)
        }
    }
}

//登录框状态枚举
enum LoginShowType {
    case NONE
    case USER
    case PASS
}
