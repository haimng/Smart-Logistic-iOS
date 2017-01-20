//
//  String.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/18/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.characters.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.characters.count
    }
    
    var cell: String {
        return self+"Cell"
    }
    
    var vc: String {
        return self+"ViewController"
    }
}
