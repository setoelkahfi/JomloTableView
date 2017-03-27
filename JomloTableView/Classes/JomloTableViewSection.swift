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
    
    var count: Int {
        get {
            return rows.count
        }
    }
    
}
