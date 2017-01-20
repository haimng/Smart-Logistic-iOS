//
//  SettingsViewController.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/22/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBarItem()
    }
    
    // TableView
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        let h = super.tableView(tableView, heightForRowAt: indexPath)
        cell.isHidden = false

        switch indexPath.row {
        case 0: // Signout
            if(Helper.logged()){
                return h
            }else{
                cell.isHidden = true
                return 0
            }
        default:
            return h
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: // Signout
            Network.signout({ data in
                Helper.navigate(_Main, vc: _Main)
            }, failure: { error in
                Helper.error(error)
            })
        default:
            break
        }
    }
    
}

