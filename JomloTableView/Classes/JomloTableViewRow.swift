//
//  JomloTableViewRow.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation

public class JomloTableViewRow: NSObject {
    
    var identifier: String {
        return ""
    }
    
    var rowHeight: CGFloat {
        return 0
    }
    
    var estimatedRowHeight: CGFloat {
        return 0
    }
    
    // Callback for on row clicked.
    // Use IBAction on single view componen if you need to register action for a particular view inside the row
    internal var onClicked: ((JomloTableViewRow) -> (Void))?
    
    func setOnItemClickedCallback(clicked:@escaping (JomloTableViewRow) -> Void){
        onClicked = clicked
    }
    
    
    func populateView(cell: JomloTableViewCell) {
        fatalError("Should be overrided")
    }
    
    func willDisplay(cell: UITableViewCell){
        cell.separatorInset = UIEdgeInsetsMake(0, 6, 0, 6)
    }
    
    func onItemClicked() {
        if let clicked = onClicked {
            clicked(self)
        }
    }
    
}
