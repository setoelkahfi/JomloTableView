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
        
        let row0 = SimpleRow("Simple table view")
        exampleSection.addRow(row: row0)
        
        let row1 = SimpleRow("Load more")
        row1.setOnRowClicked { (row) in
            self.performSegue(withIdentifier: "showLoadMoreExample", sender: self)
        }
        exampleSection.addRow(row: row1)
        
        let row2 = SimpleRow("Dynamic height")
        exampleSection.addRow(row: row2)
        
        let row3 = SimpleRow("WebView")
        exampleSection.addRow(row: row3)
        
        let row4 = SimpleRow("Image list")
        exampleSection.addRow(row: row4)
        
        let row5 = SimpleRow("Long scrollable layout")
        exampleSection.addRow(row: row5)
        
        let row6 = SimpleRow("StackView row")
        exampleSection.addRow(row: row6)
        
        jomloTableView.addSection(section: exampleSection)
        jomloTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

