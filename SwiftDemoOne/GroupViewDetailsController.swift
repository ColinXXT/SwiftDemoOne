//
//  MessageViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 11/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class GroupViewDetailsController: UIViewController, clickImageViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backItem = UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backBtnClick))
        navigationItem.leftBarButtonItem = backItem
        //添加轮播图
        
        let showView = MessageShowView.init(frame: CGRect(x:0,y:20,width:self.view.frame.size.width,height:200))
        showView.isUserInteractionEnabled = true
        showView.delegate = self
        //关闭定时器
        //showView.isOpenTimer = false
        self.view.addSubview(showView)
        
        //Json 读取数据
        let path = Bundle.main.path(forResource: "imageData", ofType: "json")
        let jsonData = NSData.init(contentsOfFile: path!)
        
        //方法一 使用NSJsonSerialization解析
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData! as Data, options: []) as! [String:AnyObject]
            let array = json["json"] as! NSArray
            for imageData in array{
                let dict = imageData as! NSDictionary
                let model = Model.init(imageName: dict["imageName"] as! String, title: dict["title"] as! String)
                showView.dataArray.append(model)
            }
            
        } catch let error as NSError {
            print("解析出错\(error.localizedDescription)")
        }
    }
    
    
    func createButton(title: String) -> UIButton {
        //创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type:.custom)
        //设置按钮大小
        //button.frame=CGRectMake(0, 0, 80, 50)
        button.frame.size = CGSize(width: 80, height: 50)
        //设置按钮文字
        button.setTitle(title, for:UIControlState.normal)
        button.backgroundColor=UIColor.orange
        button.layer.cornerRadius = 25
        button.layer.masksToBounds = true
        return button
    }
    
    //点击轮播图
    func clickImageView(index: NSInteger){
        let alertMsg = UIAlertController.init(title: "提示", message: "点击第\(index)个", preferredStyle: .alert)
        self.present(alertMsg, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func backBtnClick(){
        navigationController?.popViewController(animated: true)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

