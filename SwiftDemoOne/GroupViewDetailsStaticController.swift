//
//  GroupViewDetailsStaticController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 18/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class GroupViewDetailsStaticController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let textView = UITextView(frame:CGRect.init(x: 0, y: 100, width: self.view.bounds.width, height: self.view.bounds.height / 2 ))
        textView.text = "饮料即饮品，是供人或者牲畜饮用的液体，它是经过定量包装的，供直接饮用或按一定比例用水冲调或冲泡饮用的，乙醇含量(质量分量)不超过0.5%的制品，饮料也可分为饮料浓浆或固体形态，它的作用是解渴、提供营养或提神。"
        textView.textColor = UIColor.black
        textView.backgroundColor = UIColor.clear
        textView.textAlignment = NSTextAlignment.center
        self.view.addSubview(textView)
        
        let backBtn = createButton(title: "返回")
        backBtn.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height / 2)
        backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        self.view.addSubview(backBtn)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    @objc func backAction(){
        self.dismiss(animated: true, completion: nil)
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
