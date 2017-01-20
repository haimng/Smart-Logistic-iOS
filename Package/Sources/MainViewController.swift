//
//  ViewController.swift
//  SmartLogistic
//
//  Created by Hai Minh Nguyen on 7/18/16.
//  Copyright © 2016 VNDB Inc. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

//    var searchBar: SearchBar!
    var reviews = [
        ["image": "ic_menu_black_24dp.png", "comment": "comment1"],
        ["image": "icon_search.png", "comment": "comment2"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setNavigationBarItem()
        self.tableView.registerCellNib(ReviewCell.self)
        
        // SearchBar
        let searchBar = SearchBar.loadNib()
        self.navigationItem.titleView = searchBar
    }
    
//    override func viewWillAppear(animated: Bool) {
//        super.viewWillAppear(animated)
//    }

    
    // TableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ReviewCell.height()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ReviewCell.identifier) as! ReviewCell
        let review = reviews[indexPath.row]
        let data = ReviewCellData(imageUrl: review["image"]!, text: review["comment"]!)
        cell.setData(data)
        return cell
    }

}
