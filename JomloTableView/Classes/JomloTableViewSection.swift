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
    
    // Count rows in this table view section
    var count: Int {
        get {
            return rows.count
        }
    }
    
    // Add a single row for this table view section
    func addRow(row: JomloTableViewRow) {
        self.rows.append(row);
    }
    
    // Remove all rows in this table view section
    func removeAllRows() {
        self.rows.removeAll()
    }
    
}
