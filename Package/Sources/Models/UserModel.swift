//
//  UserModel.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/25/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

class UserModel : BaseModel {
 
    var id: Int = 0
    var sid: String = ""
    var email: String = ""
    var first_name: String = ""
    var last_name: String = ""
    
    init(user: AnyObject?) {
        if(user == nil) { return; }
        let u = user as! NSDictionary
        
        if(u["id"] != nil ) { id = u["id"] as! Int }
        if(u["sid"] != nil ) { sid = u["sid"] as! String }
        if(u["email"] != nil ) { email = u["email"] as! String }
        if(u["first_name"] != nil ) { first_name = u["first_name"] as! String }
        if(u["last_name"] != nil ) { last_name = u["last_name"] as! String }
    }
    
    override var dict : NSDictionary {
        return ["id": id, "sid": sid, "email": email, "first_name": first_name, "last_name": last_name]
    }
    
}
