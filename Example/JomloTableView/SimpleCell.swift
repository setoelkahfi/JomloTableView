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

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

class SimpleRow: JomloTableViewRow {
    
    override var identifier: String {
        return "SimpleCell"
    }
    
    override var rowHeight: CGFloat {
        return 80
    }
    
    override var estimatedRowHeight: CGFloat {
        return 80
    }
    
    override func populateView(cell: JomloTableViewCell) {
    
    }
    
}
