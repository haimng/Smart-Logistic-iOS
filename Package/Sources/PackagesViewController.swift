//
//  PackagesViewController.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 2/16/17.
//  Copyright © 2017 VNDB Inc. All rights reserved.
//

import UIKit
import PagingMenuController

private struct PagingMenuOptions: PagingMenuControllerCustomizable {
    private static let menuData = [
        [_title: "Mới", _status: _new],
        [_title: "Đã gửi", _status: _src_portal],
        [_title: "Đang gửi", _status: _delivering],
        [_title: "Chờ nhận", _status: _dest_portal],
        [_title: "Đã nhận", _status: _delivered]
    ]
    private let pagingControllers = menuData.map { (menu:[String:String]) in PackageTableViewController() }
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {            
            return .standard(widthMode: .flexible, centerItem: true, scrollingMode: .pagingEnabled)
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return menuData.map { (menu:[String:String]) in MenuItem(title: menu[_title]!) }
        }
    }
    
    fileprivate struct MenuItem: MenuItemViewCustomizable {
        var title: String
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: title))
        }
    }
}

class PackagesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
        
        // PagingMenuController
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        pagingMenuController.view.frame.origin.y += 64
        pagingMenuController.view.frame.size.height -= 64
        addChildViewController(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParentViewController: self)
    }
    
}
