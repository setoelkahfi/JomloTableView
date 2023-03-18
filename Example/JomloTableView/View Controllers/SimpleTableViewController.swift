//
//  SimpleTableViewController.swift
//  JomloTableView
//
//  Created by SDMobile on 4/10/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import JomloTableView

class SimpleTableViewController: UIViewController {

    @IBOutlet var jomloTableView: JomloTableView!
    
    let tableSection = JomloTableViewSection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jomloTableView.addSection(section: tableSection)
        
    }

    internal func loadTweets() {
        
        let searchEndPoint = "https://api.twitter.com/1.1/search/tweets.json"
        let params = ["q" : "jomlo"]
        var clientError: NSError?
    }

    internal func populate(data: Data) {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                print("json: \(json)")
                if let statuses = json["statuses"] as? [Any] {
//                    print("statuses: \(statuses)")
                    for status in statuses {
                        print("status: \(status)")
                        let status = status as! [String: Any]
//                      print("\(status["text"])")
                        let user = status["user"] as! [String: Any]
                        
                        let row = SimpleRow("@\(user["screen_name"] as! String) \(user["name"] as! String)", subTitle: status["text"] as! String)
                        tableSection.addRow(row: row)

                    }
                    DispatchQueue.main.async {
                        self.jomloTableView.reloadData()
                    }
                }
            }
            
            
        } catch let jsonError as NSError {
            print("json error: \(jsonError.localizedDescription)")
        }
    }
}
