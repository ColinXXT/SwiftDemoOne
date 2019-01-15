//
//  FoodViewController.swift
//  SwiftDemoOne
//
//  Created by HSBC Mobile on 10/1/19.
//  Copyright © 2019年 Demo. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    var tableView: UITableView = UITableView()
    //测试数据 存储在本地数据库
    var dataSource: [FoodViewMode] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //注入数据
        dataSource = [FoodViewMode(id: "1", images: "Icon-60", title: "蛋糕", date: dateFromString(dateStr: "2018-11-11")!),
                      FoodViewMode(id: "2", images: "green_tea", title: "绿茶", date: dateFromString(dateStr: "2018-11-12")!),
                      FoodViewMode(id: "3", images: "Icon-60", title: "汉堡包", date: dateFromString(dateStr: "2018-11-13")!),
                      FoodViewMode(id: "4", images: "green_tea", title: "咖啡", date: dateFromString(dateStr: "2018-11-14")!)]
    
        //导航栏 back & 编辑 按钮
        //let addItem = UIBarButtonItem.init(title: "➕", style: UIBarButtonItemStyle.plain, target: self, action: #selector(addBtnClick))
        //let editItm = UIBarButtonItem.init(title: "编辑", style: .plain, target: self, action: #selector(editBtnClick))
        let editItm = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.edit, target: self, action: #selector(editBtnClick))
        //editItm.tintColor = UIColor.colorWithHexString("DAA520")

        
        
        navigationItem.rightBarButtonItem = editItm
       // navigationItem.rightBarButtonItem = addItem
        
        
        tableView = UITableView(frame:CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style:UITableViewStyle.plain)
        
        tableView.tableFooterView = UIView()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
    }
    
    
    //显示行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    // 设置cell高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //tableViewCell 展示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if (cell == nil) {
            cell = UITableViewCell.init(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellId)
        }
        
        
        let tableViews = dataSource[indexPath.row] as FoodViewMode
        cell?.textLabel?.text = tableViews.title
        cell?.imageView?.image = UIImage.init(named: tableViews.images)
        cell?.imageView?.layer.cornerRadius = 25
        cell?.imageView?.layer.masksToBounds = true
        
        //国际化
        let dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale: NSLocale.current)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
        cell?.detailTextLabel?.text = "生产日期："+dateFormatter.string(from: tableViews.date as Date)
        return cell!
    }
    
    //删除操作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            //删除数据源当前的数据
            dataSource.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
        }
    }
    
    //确认删除操作
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "确认删除"
    }
    
    //编辑操作
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    //移动操作
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        if sourceIndexPath != destinationIndexPath {
            //获取移动的值
            let itemValue = dataSource[sourceIndexPath.row]
            
            //删除移动的值
            dataSource.remove(at: sourceIndexPath.row)
            
            //如果移动的区域大于现有行数 拼在最后面
            if destinationIndexPath.row > dataSource.count {
                dataSource.append(itemValue)
            }else{
                dataSource.insert(itemValue, at: destinationIndexPath.row)
            }
        }
    }
    //点击Cell操作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        //跳转到新页面
//        let tableViews = dataSource[indexPath.row] as FoodViewMode
//        let collection = DetailViewController()
//        let dataStr = self.dataSource[indexPath.row]
        //国际化
        let dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy-MM-dd", options: 0, locale: NSLocale.current)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        
//        collection.title = tableViews.title
//        collection.dateDetails = dateFormatter.string(from: dataStr.date as Date)
//        collection.imageDetails = dataStr.images
//
//
//        navigationController?.pushViewController(collection, animated: true)
//
    }
    
    
    //添加按钮
    @objc func addBtnClick(sender:UIButton) {
        //添加一个在最前面
        
        let index = IndexPath.init(row: 0, section: 0)
        
        self.tableView.insertRows(at: [index], with: UITableViewRowAnimation.fade)
    }
    
    //编辑按钮
    @objc func editBtnClick() {
        if self.tableView.isEditing == false {
            self.tableView.setEditing(true, animated: true)
        }else{
            self.tableView.setEditing(false, animated: true)
        }
    }
    //Date to String
    func dateFromString(dateStr:String) -> NSDate?{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateStr)
        return (date! as NSDate)
    }
    
}




