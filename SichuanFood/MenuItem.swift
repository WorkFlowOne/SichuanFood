//
//  MenuItem.swift
//  SichuanFood
//
//  Created by WinslowOne on 2019/3/13.
//  Copyright © 2019年 Xishi. All rights reserved.
//

//class MenuItem {
//    var name:String
//    init() {
//        name = ""
//    }
//}

class MenuItem : MenuComponent {
    
    var name:String
    var child: Array<MenuComponent>
    var isExpand: Bool = true
    var isGroup: Bool {
        if child.count > 0 {
            return true
        }
        return false
    }
    
    init() {
        name = ""
        child = []
    }
    
    func add(item: MenuComponent) {
        child.append(item)
    }

    func itemAt(index: Int) -> MenuComponent? {
        var count = 1
        var ret:MenuComponent?
        
        if index == 0 {
            return self
        }
        
        for item in self.child {
            if (index >= count + item.count()) {
                count += item.count()
            } else {
                ret = item.itemAt(index:index - count)
                break
            }
        }
        return ret
    }
    
    func count() -> Int {
        var count = 1 //自己为第一项
        if (self.isExpand) {
            for item in self.child {
               count += item.count()
            }
        }
        return count
    }
    
    
}
