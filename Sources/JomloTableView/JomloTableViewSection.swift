//
//  JomloTableViewSection.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation
#if canImport(UIKit)
import UIKit

@available(iOS 11.0, tvOS 11.0, *)
public class JomloTableViewSection {
    
    /**
    Internal array of rows in this section.
    **/
    internal var rows = Array<JomloTableViewRow>()
    
    /**
    The only initializer required for this class. It needs to explicitly declared as public so can be initialized from outside module.
    **/
    public init() {
        
    }
    
    /**
    Computed property to count rows in this section.
    **/
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
    
    // Remove last row in this table view section
    public func removeLastRow() {
        self.rows.removeLast()
    }
    
    // Remove first row in this table view section
    public func removeFirstRow() {
        self.rows.removeFirst()
    }
    
}
#endif
