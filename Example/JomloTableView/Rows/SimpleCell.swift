//
//  SimpleCell.swift
//  JomloTableView
//
//  Created by SDMobile on 3/28/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import JomloTableView

class SimpleCell: JomloTableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!

}

class SimpleRow: JomloTableViewRow {
    
    var title: String!
    var subTitle: String!
    
    init(_ title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }
    
    
    override var identifier: String {
        return "SimpleCell"
    }
    
    override var rowHeight: CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override var estimatedRowHeight: CGFloat {
        return 64
    }
    
    override func populateView(cell: JomloTableViewCell) {
        let cell = cell as! SimpleCell
        cell.titleLabel.text = title
        cell.subTitleLabel.text = subTitle
    }
    
}
