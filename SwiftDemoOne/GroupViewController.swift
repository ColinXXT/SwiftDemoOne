//
//  GroupViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 10/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var tableView:UITableView?
    
    var allnames:Dictionary<Int, [String]>?
    
    var adHeaders:[String]?
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化数据
        self.allnames =  [
            0:[String](["汉堡包","蛋糕"]),
            1:[String](["绿茶","咖啡"])
        ]
    
        
        self.adHeaders = ["精品食物","畅销冷饮"]
        
        //创建表视图
        self.tableView = UITableView(frame:self.view.frame, style:UITableViewStyle.grouped)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
       
    }
    // section数量
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = self.allnames?[section]
        return data!.count
    }
    
    
    // UITableViewDataSource协议中的方法，该方法的返回值决定指定分区的头部
    func tableView(_ tableView:UITableView, titleForHeaderInSection section:Int)->String?{

        var headers = self.adHeaders!
        print(section)
        return headers[section]
    }
    
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        //为了提供表格显示性能，已创建完成的单元需重复使用
        let identify:String = "SwiftCell"
        //同一形式的单元格重复使用，在声明时已注册
        let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
            as UITableViewCell
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        let secno = indexPath.section

        var data = self.allnames?[secno]

        cell.textLabel?.text = data![indexPath.row]
        
        return cell
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
}
