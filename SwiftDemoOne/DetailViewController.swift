//
//  DetailViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 10/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "detailsViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellId)
        }
        cell?.tintColor = UIColor.red
        cell?.imageView?.image = UIImage.init(named: "Icon_add")
        cell?.textLabel?.text = "Test"
        cell?.imageView?.layer.cornerRadius = 25
        cell?.imageView?.layer.masksToBounds = true
        cell?.detailTextLabel?.text = "Test details"
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var tableView: UITableView = UITableView()
        
        //导航栏 back & 编辑 按钮
        let backItm = UIBarButtonItem.init(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(backBtnClick))
        let editItm = UIBarButtonItem.init(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector(editBtnClick))
        
        backItm.tintColor = UIColor.black
        editItm.tintColor = UIColor.black
        
        navigationItem.leftBarButtonItem = backItm
        navigationItem.rightBarButtonItem = editItm
        
        tableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style:UITableViewStyle.plain)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.view.addSubview(tableView)
   
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
