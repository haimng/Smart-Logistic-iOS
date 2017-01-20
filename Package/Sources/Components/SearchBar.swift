//
//  SearchBar.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/19/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

open class SearchBar : UIView {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var keywordField: UITextField!
    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setup()
//    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
    
    open override func awakeFromNib() {
        super.awakeFromNib();
        setup()
    }
    
    open func setup() {
        self.frame = CGRect(x: 0, y: 0, width: Helper.width!-50, height: self.frame.height)
        self.layer.borderColor = UIColor(hex: "e5e9eb").cgColor
        self.layer.borderWidth =  1
        self.layer.cornerRadius = 5
    }
    
}
