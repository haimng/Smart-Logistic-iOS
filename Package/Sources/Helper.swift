//
//  Helper.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/19/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit
import AwesomeCache
import SlideMenuControllerSwift

class Helper {
    
    static var slideMenu: SlideMenuController?
    static var width: CGFloat?
    static var height: CGFloat?
    
    static var user: UserModel?
    
    static func setup() {
        let user = Helper.getCache(_user)
        if(user != nil) {
            Helper.user = UserModel(user: user)
        }
    }
    
    static func vc(_ sb: String, vc: String) -> UIViewController {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: vc.vc)
    }
    
    static func nvc(_ sb: String, vc: String) -> UINavigationController {
        return UINavigationController(rootViewController: Helper.vc(sb, vc: vc))
    }
    
    static func navigate(_ sb: String, vc: String) {
        let nvc: UINavigationController = Helper.nvc(sb, vc: vc)
        slideMenu!.changeMainViewController(nvc, close: true)
    }
    
    static func setPref(_ key: String, value: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    static func getPref(_ key: String) -> String {
        let defaults = UserDefaults.standard
        let value = defaults.string(forKey: key)
        return value != nil ? value! : ""
    }
    
    static func setCache(_ key: String, value: NSDictionary?) {
        do {
            let cache = try Cache<NSDictionary>(name: _main_cache)
            cache[key] = value
        } catch _ {
            print("setCache: error")
        }
    }
    
    static func getCache(_ key: String) -> NSDictionary? {
        do {
            let cache = try Cache<NSDictionary>(name: _main_cache)
            return cache[key]
        } catch _ {
            print("getCache: error")
            return nil
        }
    }
    
    static func deleteCache(_ key: String) {
        Helper.setCache(key, value: nil)
    }
    
    static func setSid(_ sid: String) {
        Helper.setPref("_sid", value: sid)
    }
    
    static func getSid() -> String {
        return Helper.getPref("_sid")
    }
    
    static func setUser(_ user: UserModel) {
        Helper.user = user
        Helper.setCache(_user, value: user.dict)
    }
    
    static func signin(_ user: UserModel!) {
        Helper.setUser(user);
        Helper.setSid(user.sid)
    }
    
    static func signout() {
        Helper.user = nil;
        Helper.deleteCache(_user)
        Helper.setSid("")
    }
    
    static func logged() -> Bool {
        let sid = Helper.getSid()
        return !sid.isEmpty && user != nil
    }
    
    static func dialog(_ title: String, message: String, btnTitle1: String?, btnHandler1: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        if(btnTitle1 != nil && btnHandler1 != nil){
            alert.addAction(UIAlertAction(title: btnTitle1, style: UIAlertActionStyle.default, handler: btnHandler1))
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        
        slideMenu!.present(alert, animated: true, completion: nil)
    }
    
    static func error(_ message: String?) {
        Helper.dialog("Error", message: message != nil && !message!.isEmpty ? message! : "We're working hard on the issue.", btnTitle1: nil, btnHandler1: nil)
    }
}
