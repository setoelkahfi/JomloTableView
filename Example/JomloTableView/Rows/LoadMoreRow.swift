//
//  LoadMoreRow.swift
//  JomloTableView
//
//  Created by Seto Elkahfi on 4/5/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import JomloTableView

class LoadMoreRow: JomloTableViewRow {
    
    internal var onLoadMore: (() -> Void)!
    
    init(_ onLoadMore: @escaping ()->Void) {
        self.onLoadMore = onLoadMore
    }
    
    override var identifier: String {
        return "LoadMoreCell"
    }
    
    override var rowHeight: CGFloat {
        return 44
    }
    
    override var estimatedRowHeight: CGFloat {
        return 44
    }
    
    override func populateView(cell: JomloTableViewCell) {
        let cell = cell as! LoadMoreCell
        cell.activityIndicator.startAnimating()
        onLoadMore()
    }
    
}
