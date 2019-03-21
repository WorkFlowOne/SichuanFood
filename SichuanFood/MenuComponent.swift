//
//  MenuComponent.swift
//  SichuanFood
//
//  Created by WinslowOne on 2019/3/21.
//  Copyright © 2019年 Xishi. All rights reserved.
//

protocol MenuComponent {
    var name:String { get }
    var child:Array<MenuComponent> { get }
    var isExpand:Bool { get set }
    var isGroup:Bool { get }
    func add(item:MenuComponent)
    func itemAt(index:Int) -> MenuComponent?
    func count() -> Int
}
