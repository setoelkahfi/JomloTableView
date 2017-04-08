//
//  ViewController.swift
//  JomloTableView
//
//  Created by setoelkahfi on 03/27/2017.
//  Copyright (c) 2017 setoelkahfi. All rights reserved.
//

import UIKit
import JomloTableView

class ViewController: UIViewController {
    
    @IBOutlet var jomloTableView: JomloTableView!
    
    var exampleSection = JomloTableViewSection()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let row0 = SimpleRow("Simple table view", subTitle: "A simple table view like we usually use. But this time, we use JomloTableView.")
        exampleSection.addRow(row: row0)
        
        let row1 = SimpleRow("Load more", subTitle: "A JomloTableView with load more row at the bottom. Will load infinite row if we scroll the table view to the bottom.")
        row1.setOnRowClicked { (row) in
            self.performSegue(withIdentifier: "showLoadMoreExample", sender: self)
        }
        exampleSection.addRow(row: row1)
        
        let row2 = SimpleRow("Dynamic height", subTitle: "Example how to use dynamic height for single row. In fact, this example rows is also use dynamic height.")
        exampleSection.addRow(row: row2)
        
        let row3 = SimpleRow("WebView", subTitle: "A JomloTableView with WebView inside of its row.")
        exampleSection.addRow(row: row3)
        
        let row4 = SimpleRow("Image list", subTitle: "A JomloTableView with image views inside of its row.")
        exampleSection.addRow(row: row4)
        
        let row5 = SimpleRow("Long scrollable layout", subTitle: "A JomloTableView which doesn't look like a table view. ")
        exampleSection.addRow(row: row5)
        
        let row6 = SimpleRow("StackView row", subTitle: "A JomloTableView with UIStackView inside of its rows. Here we use UITableViewAutomaticDimension for row's height property.")
        exampleSection.addRow(row: row6)
        
        jomloTableView.addSection(section: exampleSection)
        jomloTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

