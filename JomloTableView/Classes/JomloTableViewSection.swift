//
//  JomloTableViewSection.swift
//  Pods
//
//  Created by SDMobile on 3/27/17.
//
//

import Foundation

public class JomloTableViewSection {
    
    var rows = Array<JomloTableViewRow>()
    
    public init() {
        
    }
    
    // Count rows in this table view section
    public var count: Int {
        get {
            return rows.count
        }
    }
    
    // Add a single row for this table view section
    public func addRow(row: JomloTableViewRow) {
        self.rows.append(row);
    }
    
    // Remove all rows in this table view section
    public func removeAllRows() {
        self.rows.removeAll()
    }
    
}
