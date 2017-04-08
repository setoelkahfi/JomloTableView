//
//  LoadMoreViewController.swift
//  JomloTableView
//
//  Created by Seto Elkahfi on 4/8/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import JomloTableView

class LoadMoreViewController: UIViewController {
    
    @IBOutlet var jomloTableView: JomloTableView!
    
    let tableSection = JomloTableViewSection()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        jomloTableView.addSection(section: tableSection)
        addRows()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addRows() {
        for _ in 0..<8 {
            let rowNumber = tableSection.count + 1
            let row = SimpleRow("Row \(rowNumber)", subTitle: "Example row.")
            tableSection.addRow(row: row)
        }
        
        addLoadMoreRow()
    }
    
    func addLoadMoreRow() {
        
        let loadMoreRow = LoadMoreRow {
            // To get the effect or loading, delay the execution after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3, execute: {
                self.tableSection.removeLastRow()
                self.addRows()
            })
        }
        
        tableSection.addRow(row: loadMoreRow)
        jomloTableView.reloadData()
    }

}
