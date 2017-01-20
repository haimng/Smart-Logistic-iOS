//
//  ReviewCell.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/19/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

struct ReviewCellData {
    
    init(imageUrl: String, text: String) {
        self.imageUrl = imageUrl
        self.text = text
    }
    
    var imageUrl: String
    var text: String
}

class ReviewCell : BaseTableViewCell {
    
    @IBOutlet weak var dataImage: UIImageView!
    @IBOutlet weak var dataText: UILabel!
    
    override func awakeFromNib() {
        self.dataText?.font = UIFont.italicSystemFont(ofSize: 16)
        self.dataText?.textColor = UIColor(hex: "9E9E9E")
    }
    
    override class func height() -> CGFloat {
        return 100
    }
    
    override func setData(_ data: Any?) {
        if let data = data as? ReviewCellData {
            self.dataImage.image = UIImage(named: data.imageUrl)!
            self.dataText.text = data.text
        }
    }
}
