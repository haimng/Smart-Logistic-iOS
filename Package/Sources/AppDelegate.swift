//
//  AppDelegate.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/18/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        UINavigationBar.appearance().tintColor = UIColor.green
        
        let mainNVC = Helper.nvc(_Main, vc: _Main)
        let leftVC = Helper.vc(_Main, vc: _Left) as! LeftViewController
        
        let slideMenu = SlideMenuController(mainViewController: mainNVC, leftMenuViewController: leftVC)
        slideMenu.automaticallyAdjustsScrollViewInsets = true
        slideMenu.delegate = leftVC
//        self.window?.backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
        self.window?.rootViewController = slideMenu
        self.window?.makeKeyAndVisible()
        
        Helper.setup()
        Helper.slideMenu = slideMenu
        Helper.width = window?.screen.bounds.width
        Helper.height = window?.screen.bounds.height
        
        // Check user session
        Network.getUser("me", success: { user in
            Helper.setUser(user)
//            print(Helper.user)
        }, failure: { error in
            if("Unauthorized" == error) { // TODO: use code 401
                Helper.signout()
            }
        })
        
        // TODO: Test
//        Helper.setSid("")
//        let nvc: UINavigationController = Helper.nvc(_Signup, vc: _Signin)
//        slideMenuController.changeMainViewController(nvc, close: true)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

