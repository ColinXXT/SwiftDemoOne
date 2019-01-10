//
//  DetailViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 10/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        //导航栏 back & 编辑 按钮
        let backItm = UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backBtnClick))
        let editItm = UIBarButtonItem.init(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(editBtnClick))
        
        backItm.tintColor = UIColor.black
        editItm.tintColor = UIColor.black
        
        navigationItem.leftBarButtonItem = backItm
        navigationItem.rightBarButtonItem = editItm
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    //添加按钮
    @objc func backBtnClick(sender:UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    //编辑按钮
    @objc func editBtnClick() {
    
    }
}
