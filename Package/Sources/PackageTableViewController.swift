//
//  PackagesViewController.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 2/16/17.
//  Copyright © 2017 VNDB Inc. All rights reserved.
//

import UIKit

class PackageTableViewController: UITableViewController {
    
    var packages = [
        [_title: "Đơn hàng 1"],
        [_title: "Đơn hàng 2"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerCellNib(PackageCell.self)
    }
    
    // TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return packages.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return PackageCell.height()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: PackageCell.identifier) as! PackageCell
        let package = packages[indexPath.row]
        let data = PackageCellData(imageUrl: "icon_search.png", text: package[_title]!)
        cell.setData(data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: Helper.navigate(_Packages, vc: _Package)
        let vc: UIViewController = Helper.vc(_Packages, vc: _Package)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
