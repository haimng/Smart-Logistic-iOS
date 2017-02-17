//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit
import SlideMenuControllerSwift

enum Menu: Int {
    case profile = 0
    case main
    case notifications
    case packages
    case settings
}

class LeftViewController : UITableViewController {
        
    var menus = ["Profile", "Main", "Settings"]
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.tableView.separatorColor = UIColor.blueColor()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func updateProfile() {
        if(Helper.logged()){
            let user = Helper.user!
            let name = user.first_name + " " + user.last_name
            if(label.text != name) {
                label.text = name
            }
        }
        else {
            label.text = "Đăng nhập | Đăng ký"
        }
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = Menu(rawValue: indexPath.item) {
            var nvc: UINavigationController = Helper.nvc(_Main, vc: _Main)
            switch menu {
            case .profile:
                nvc = Helper.logged() ? Helper.nvc(_Profile, vc: _Profile) : Helper.nvc(_Signup, vc: _Signup)
                break
            case .packages:
                nvc = Helper.nvc(_Packages, vc: _Packages)
                break
            case .settings:
                nvc = Helper.nvc(_Settings, vc: _Settings)
                break
            default: break
            }
            self.slideMenuController()?.changeMainViewController(nvc, close: true)
        }
    }
    
}

extension LeftViewController : SlideMenuControllerDelegate {
    func leftWillOpen() {
        self.updateProfile()
    }
    
    func leftDidOpen() {}
    func leftWillClose() {}
    func leftDidClose() {}
    func rightWillOpen() {}
    func rightDidOpen() {}
    func rightWillClose() {}
    func rightDidClose() {}
}

