//
//  JomloTableView.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation
#if canImport(UIKit)
import UIKit

/**
 This main class is basically a subclass from UITableView with sections array to hold row(s).
 This table view directly conform to UITableViewDelegate and UITableViewDataSource, makes your 
 view controller that use table view free from conforming these two protocols.
 
 */
@available(iOS 11.0, tvOS 11.0, *)
public class JomloTableView: UITableView {
    
    // Table view section
    var sections = Array<JomloTableViewSection>()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self
        dataSource = self
        tableFooterView = UIView()
    }
    
    // Count all section in this table view
    public func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Add single section to table view
    public func addSection(section: JomloTableViewSection) {
        sections.append(section)
    }
    
    // Remove all section in table view
    public func removeAllSection() {
        sections.removeAll()
    }
    
}

extension JomloTableView: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate delegate extension
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rows[indexPath.row].estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rows[indexPath.row].rowHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].rows[indexPath.row]
        item.onRowClicked()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sections[indexPath.section].rows[indexPath.row].willDisplay(cell: cell)
    }
    
}

extension JomloTableView: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource delegate extension
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if sections.count > 0 {
            return sections[section].count
        } else {
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].rows[indexPath.row]
        let identifier = item.identifier
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? JomloTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? JomloTableViewCell
        }
        
        item.populateView(cell: cell!)
        
        return cell!

    }
    
}
#endif
