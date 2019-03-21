//
//  ViewControllerComposite.swift
//  SichuanFood
//
//  Created by WinslowOne on 2019/3/21.
//  Copyright © 2019年 Xishi. All rights reserved.
//

import UIKit

class ViewControllerComposite: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cellID = "cellComposite"
    var menu:MenuComponent = MenuItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainCoursesMenu = MenuItem()
        mainCoursesMenu.name = "主菜"
        for name in ["宫保鸡丁", "干烧鱼", "回锅肉", "麻婆豆腐", "家常豆腐", "黄焖鸭", "夫妻肺片", "盐水鸭", "锅巴肉片"] {
            let menuItem = MenuItem()
            menuItem.name = name
            mainCoursesMenu.add(item:menuItem)
        }
        self.menu.add(item:mainCoursesMenu)
        
        let snackMenu = MenuItem()
        snackMenu.name = "早餐"
        for name in ["担担面", "川北凉粉", "麻辣小面", "酸辣面", "酸辣粉"] {
            let menuItem = MenuItem()
            menuItem.name = name
            snackMenu.add(item: (menuItem))
        }
        self.menu.add(item: snackMenu)
        
        let tableView = UITableView(frame: view.bounds)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    // MARK:- UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count() - 1 // 根菜单不需要显示
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        let menuItem = self.menu.itemAt(index: indexPath.row + 1)
        
        var indent = "    "
        if ((menuItem?.isGroup)!) {
            indent = ""
        }
        cell?.textLabel?.text = "\(indent)\(menuItem?.name ?? "")"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var menuItem = self.menu.itemAt(index: indexPath.row + 1)
        menuItem!.isExpand = !(menuItem!.isExpand)
        tableView.reloadData()
    }
}
