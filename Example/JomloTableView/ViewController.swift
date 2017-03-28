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
        // Do any additional setup after loading the view, typically from a nib.
        
        let row = SimpleRow()
        
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        exampleSection.addRow(row: row)
        
        jomloTableView.addSection(section: exampleSection)
        jomloTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

