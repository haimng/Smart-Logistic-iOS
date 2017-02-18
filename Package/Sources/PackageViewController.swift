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
        [_title: "Gói hàng", _paging_controller: Helper.vc(_Packages, vc: _PackageInfo)],
        [_title: "Người gửi", _paging_controller: Helper.vc(_Packages, vc: _PackageSender)],
        [_title: "Người nhận", _paging_controller: Helper.vc(_Packages, vc: _PackageReceiver)]
    ]
    private let pagingControllers = menuData.map { (menu:[String:Any]) in menu[_paging_controller] }
    
    fileprivate var componentType: ComponentType {
        return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers as! [UIViewController])
    }
    
    fileprivate struct MenuOptions: MenuViewCustomizable {
        var displayMode: MenuDisplayMode {
            return .segmentedControl
        }
        var itemsOptions: [MenuItemViewCustomizable] {
            return menuData.map { (menu:[String:Any]) in MenuItem(title: menu[_title]! as! String) }
        }
    }
    
    fileprivate struct MenuItem: MenuItemViewCustomizable {
        var title: String
        var displayMode: MenuItemDisplayMode {
            return .text(title: MenuItemText(text: title))
        }
    }
}

class PackageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Đơn hàng #123"
        
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
