//
//  MyViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 23/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    struct GroceryProduct{
        var imageName: String
        var title: String
    }
    
    var userImage: UIImage = UIImage(named: "v2_my_avatar")!
    
    lazy var bodyTableView: UITableView = {
        let bodyTableView = UITableView()
        bodyTableView.delegate = self
        bodyTableView.dataSource = self
        bodyTableView.frame = CGRect.init(x: 0, y: 210, width: self.view.bounds.width, height: self.view.bounds.size.height - 210)
        bodyTableView.rowHeight = 55
        bodyTableView.showsVerticalScrollIndicator = false
        //bodyTableView.separatorColor = UIColor.clear
        
        bodyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "bodyTableCell")
        return bodyTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //HearderView
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.width, height: 160))
        headerView.backgroundColor = UIColor.colorWithHexString("F0E68C")
        
        let settingImage = UIImage.init(named: "v2_my_settings_icon")
        
        
        let userBtn:UIButton = UIButton(type:.custom)
        let settingBtn : UIButton = UIButton.init(type: .custom)
        //设置按钮大小
        userBtn.frame.size = CGSize(width: 50, height: 50)
        settingBtn.frame.size = CGSize.init(width: 50, height: 50)
        //设置按钮文字

        userBtn.addTarget(self, action: #selector(userClick), for: .touchUpInside)
        userBtn.setImage(userImage, for: .normal)
        settingBtn.setImage(settingImage, for: .normal)
        
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
        self.view.addSubview(bodyTableView)
        
    }
    @objc func userClick(){

        let sexActionSheet = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        weak var weakSelf = self
        let sexNanAction = UIAlertAction(title: "从相册中选择", style: UIAlertActionStyle.default){ (action:UIAlertAction)in
            
            weakSelf?.initPhotoPicker()
            //填写需要的响应方法
     
        }
        
        let sexNvAction = UIAlertAction(title: "拍照", style: UIAlertActionStyle.default){ (action:UIAlertAction)in
            
            weakSelf?.initCameraPicker()
            //填写需要的响应方法
          
        }
        
        
        let sexSaceAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel){ (action:UIAlertAction)in
            //填写需要的响应方法
            self.dismiss(animated: true, completion: nil)
        }
        
        
        sexActionSheet.addAction(sexNanAction)
        sexActionSheet.addAction(sexNvAction)
        sexActionSheet.addAction(sexSaceAction)
        
        self.present(sexActionSheet, animated: true, completion: nil)
    }
    
    
    @objc func settingClick(){
        print("Setting Click")
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
    
    func initPhotoPicker(){
        let photoPicker = UIImagePickerController()
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
        photoPicker.sourceType = .photoLibrary
        //在需要的地方present出来
        self.present(photoPicker, animated: true, completion: nil)
    }
    
    func initCameraPicker(){
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraPicker = UIImagePickerController()
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = .camera
            
            self.present(cameraPicker, animated: true, completion: nil)
        }
        else{
            print("不支持拍照")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        //获得照片
        let image:UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        //拍照
        if picker.sourceType == .camera{
            //保存相册
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
        }
        self.userImage = image
        
        self.dismiss(animated: true, completion: nil)
    }
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject) {
        if error != nil {
            print("保存失败")
        } else {
            print("保存成功")
        }
    }
}


extension MyViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    //返回自定义单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bodyTableCell")
        
        //Json 读取数据
        let path = Bundle.main.path(forResource: "imageData", ofType: "json")
        let jsonData = NSData.init(contentsOfFile: path!)
        var products = [GroceryProduct]()
        
        //方法一 使用NSJsonSerialization解析
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData! as Data, options: []) as! [String:AnyObject]
            let array = json["json"] as! NSArray
            for imageData in array{
                let dict = imageData as! NSDictionary
                let model = GroceryProduct.init(imageName: dict["imageName"] as! String, title: dict["title"] as! String)
                products.append(model)
            }
            
        } catch let error as NSError {
            print("解析出错\(error.localizedDescription)")
        }
        
        
        cell?.textLabel?.text = products[indexPath.row].title
        cell?.imageView?.image = UIImage.init(named: products[indexPath.row].imageName) 
    
        let myImageSize: CGSize = CGSize.init(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(myImageSize, false, 0.0)
        let myImageRect = CGRect.init(x: 0, y: 0, width: myImageSize.width, height: myImageSize.height)
        cell?.imageView?.image?.draw(in: myImageRect)
        cell?.imageView?.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        cell?.imageView?.layer.cornerRadius = 25
        cell?.imageView?.layer.masksToBounds = true
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell!
    }
    
}

