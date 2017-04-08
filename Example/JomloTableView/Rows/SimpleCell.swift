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

    @IBOutlet var textlabel: UILabel!

}

class SimpleRow: JomloTableViewRow {
    
    var text: String!
    
    init(_ text: String) {
        self.text = text
    }
    
    
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
        let cell = cell as! SimpleCell
        cell.textlabel.text = text
    }
    
}
