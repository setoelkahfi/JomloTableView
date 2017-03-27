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
    

    
}

extension JomloTableView: UITableViewDelegate {
    
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
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SdTableViewCell
        if cell == nil {
            tableView.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? SdTableViewCell
        }
        
        item.populateView(cell: cell!)
        
        return cell!

    }
    
}
