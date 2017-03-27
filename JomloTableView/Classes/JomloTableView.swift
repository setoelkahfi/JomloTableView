//
//  JomloTableView.swift
//  Pods
//
//  Created by Seto Elkahfi on 3/27/17.
//
//

import Foundation

public class JomloTableView: UITableView {
    
    // Table view section
    var sections = Array<JomloTableViewSection>()
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sections.count
    }
    
    // Add single section to table view
    func addSection(section: JomloTableViewSection) {
        sections.append(section)
    }
    
    // Remove all section in table view
    func removeAllSection() {
        sections.removeAll()
    }
    
}

extension JomloTableView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rows[indexPath.row].estimatedRowHeight
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rows[indexPath.row].rowHeight
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].rows[indexPath.row]
        item.onItemClicked()
    }
    
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        sections[indexPath.section].rows[indexPath.row].willDisplay(cell: cell)
    }
    
}

extension JomloTableView: UITableViewDataSource {
    
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
