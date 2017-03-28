//
//  JomloTableViewRow.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation

open class JomloTableViewRow: NSObject {
    
    open var identifier: String {
        return ""
    }
    
    open var rowHeight: CGFloat {
        return 0
    }
    
    open var estimatedRowHeight: CGFloat {
        return 0
    }
    
    // Callback for on row clicked.
    // Use IBAction on single view componen if you need to register action for a particular view inside the row
    internal var onClicked: ((JomloTableViewRow) -> (Void))?
    
    open func setOnItemClickedCallback(clicked:@escaping (JomloTableViewRow) -> Void){
        onClicked = clicked
    }
    
    
    open func populateView(cell: JomloTableViewCell) {
        fatalError("Should be overrided")
    }
    
    open func willDisplay(cell: UITableViewCell){
        cell.separatorInset = UIEdgeInsetsMake(0, 6, 0, 6)
    }
    
    open func onItemClicked() {
        if let clicked = onClicked {
            clicked(self)
        }
    }
    
}
