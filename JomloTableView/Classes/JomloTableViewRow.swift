//
//  JomloTableViewRow.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation

open class JomloTableViewRow: NSObject {
    
    // Callback for on row clicked.
    // Use IBAction on single view component if you need to
    // register action for a particular view inside the row.
    internal var callback: ((JomloTableViewRow) -> (Void))?
    
    // An identifier of JomloTableViewCell.
    open var identifier: String {
        return ""
    }
    
    // Actual height of this row
    // Use UITableViewAutomaticDimension to set the height dynamically
    open var rowHeight: CGFloat {
        return 0
    }
    
    // Height estimation for this row
    open var estimatedRowHeight: CGFloat {
        return 0
    }
    
    open func setOnRowClicked(_ callback: @escaping (JomloTableViewRow) -> Void){
        self.callback = callback
    }
    
    // The subclass must override this method.
    // Otherwise, we throw error.
    open func populateView(cell: JomloTableViewCell) {
        fatalError("Must be overrided")
    }
    
    open func willDisplay(cell: UITableViewCell){
        cell.separatorInset = UIEdgeInsetsMake(0, 6, 0, 6)
    }
    
    // Call the callback
    open func onRowClicked() {
        if let callback = callback {
            callback(self)
        }
    }
    
}
