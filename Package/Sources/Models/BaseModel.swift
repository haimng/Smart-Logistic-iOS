//
//  BaseModel.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/25/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

class BaseModel : CustomStringConvertible {
    
    var dict : NSDictionary {
        return NSDictionary()
    }
    
    var description : String {
        return "\(self.dict)"
    }
}
