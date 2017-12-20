//
//  NavigationBarItem.swift
//  GSNavigationBarItem
//
//  Created by 孟钰丰 on 2017/12/20.
//  Copyright © 2017年 孟钰丰. All rights reserved.
//

import Foundation

/// NavigationBarItem
public struct NavigationBarItem: Hashable {
    
    /// 显示图片 显示优先级高
    public var imageName: String?
    /// 显示文字 显示优先级低
    public var title: String?
    public var titleColor: UIColor?
    public var titleFont: UIFont?
    
    /// 点击的执行闭包 执行优先级高
    public var closure: (() -> Void)?
    /// 点击的 selector 执行优先级低
    public var selector: Selector?
    
    /// 自定义view 显示优先级最高
    public var customView: UIView?
    
    /// 最终对应的 barItem
    public var barItem: UIBarButtonItem?
    
    public var hashValue: Int {
        return (imageName ?? "").hashValue + (title ?? "").hashValue + (customView?.hash ?? 0)
    }
    
    public init(selector: Selector?, title: String? = nil, imageName: String? = nil ) {
        self.selector = selector
        self.title = title
        self.imageName = imageName
    }
    
    public init(closure: (() -> Void)?, title: String? = nil, imageName: String? = nil ) {
        self.closure = closure
        self.title = title
        self.imageName = imageName
    }
    
    public init(selector: Selector?, customView: UIView) {
        self.selector = selector
        self.customView = customView
    }
    
    public init(closure: (() -> Void)?, customView: UIView) {
        self.closure = closure
        self.customView = customView
    }
    
    mutating internal func setItem(item: UIBarButtonItem) {
        self.barItem = item
    }
}

// MARK: - Hashable

public func ==(lhs: NavigationBarItem, rhs: NavigationBarItem) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

