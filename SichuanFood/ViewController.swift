//
//  ViewController.swift
//  SichuanFood
//
//  Created by WinslowOne on 2019/3/13.
//  Copyright © 2019年 Xishi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    // MARK:- 属性
    let cellID = "cell"
    var menu:Array<Array<MenuItem>> = []
    var groupExpandFlag:Array<Bool> = [true, true]
    var groupName:Array<String> = ["主菜", "早餐"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "数组"
        // 1.创建tableView,并添加的控制器的view
        let tableView = UITableView(frame: view.bounds)
        
        // 2.设置数据源代理
        tableView.dataSource = self
        tableView.delegate = self
        
        // 3.添加到控制器的view
        view.addSubview(tableView)
        
        // 4.注册cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        
        
        var mainCoursesMenu = Array<MenuItem>()
        for name in ["宫保鸡丁", "干烧鱼", "回锅肉", "麻婆豆腐", "家常豆腐", "黄焖鸭", "夫妻肺片", "盐水鸭", "锅巴肉片"] {
            let menuItem = MenuItem()
            menuItem.name = name
            mainCoursesMenu.append(menuItem)
        }
        self.menu.append(mainCoursesMenu)
        
        var snackMenu = Array<MenuItem>()
        for name in ["担担面", "川北凉粉", "麻辣小面", "酸辣面", "酸辣粉"] {
            let menuItem = MenuItem()
            menuItem.name = name
            snackMenu.append(menuItem)
        }
        self.menu.append(snackMenu)
        print("\(self.menu)")
    }

    // MARK:- UITableViewDataSource
    fileprivate func menuItemTotal() -> Int {
        var total = 0
        for (index, isExpand) in groupExpandFlag.enumerated() {
            total += 1 // 组标题占用一行
            if isExpand {
                total += menu[index].count
            }
        }
        return total
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItemTotal()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if (groupExpandFlag[0] == true && indexPath.row >= menu[0].count + 1) {
            let index = indexPath.row - (menu[0].count + 1)
            if index == 0 {
                cell?.textLabel?.text = groupName[1]
            } else {
                cell?.textLabel?.text = "    \(menu[1][index - 1].name)"
            }
        } else {
            let index = indexPath.row
            if index == 0 {
                cell?.textLabel?.text = groupName[0]
            } else if (groupExpandFlag[0] == false) {
                if (index == 1) {
                    cell?.textLabel?.text = groupName[1]
                } else {
                    cell?.textLabel?.text = "    \(menu[1][index - 1].name)"
                }
            } else {
                cell?.textLabel?.text = "    \(menu[0][index - 1].name)"
            }
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (groupExpandFlag[0] == true && indexPath.row >= menu[0].count + 1) {
            let index = indexPath.row - (menu[0].count + 1)
            if index == 0 {
                groupExpandFlag[1] = !(groupExpandFlag[1])
            } else {
                
            }
        } else {
            let index = indexPath.row
            if index == 0 {
                groupExpandFlag[0] = !(groupExpandFlag[0])
            } else if (groupExpandFlag[0] == false && index == 1) {
                groupExpandFlag[1] = !(groupExpandFlag[1])
            } else {
                
            }
        }
        tableView.reloadData()
    }
}

