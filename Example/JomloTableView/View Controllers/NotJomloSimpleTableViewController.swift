//
//  NotJomloSimpleTableViewController.swift
//  JomloTableView
//
//  Created by SDMobile on 4/17/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import TwitterKit

class NotJomloSimpleTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tweets = [Tweet]()
    
    let client = TWTRAPIClient()
    var loginButton: TWTRLogInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.isHidden = true
        
        loginButton = TWTRLogInButton { (session, error) in
            if let session = session {
                print("Signed as: \(session.userName)")
                self.loadTweets()
            } else {
                print("Error: \(error?.localizedDescription)")
            }
        }
        loginButton.center = view.center
        view.addSubview(loginButton)

    }
    
    internal func loadTweets() {
        
        let searchEndPoint = "https://api.twitter.com/1.1/search/tweets.json"
        let params = ["q" : "jomlo"]
        var clientError: NSError?
        
        let request = client.urlRequest(withMethod: "GET", urlString: searchEndPoint, parameters: params, error: &clientError)
        
        client.sendTwitterRequest(request) { (response, data, connectionError) in
            
            if let data = data {
                self.populate(data: data)
            }
            
            if let error = connectionError {
                print("Error: \(error.localizedDescription)")
            }
            
            
        }
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
                        
                        let tweet = Tweet(screenName: user["screen_name"] as! String, name: user["name"] as! String, text: status["text"] as! String)
                        // profile_image_url_https
                        tweets.append(tweet)
                        
                    }
                    DispatchQueue.main.async {
                        self.tableView.isHidden = false
                        self.loginButton.removeFromSuperview()
                        self.tableView.reloadData()
                    }
                }
            }
            
            
        } catch let jsonError as NSError {
            print("json error: \(jsonError.localizedDescription)")
        }
    }

}

extension NotJomloSimpleTableViewController: UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension NotJomloSimpleTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell") as? SimpleCell
        
        if cell == nil {
            let nib = UINib(nibName: "SimpleCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "SimpleCell")
            cell = tableView.dequeueReusableCell(withIdentifier: "SimpleCell") as? SimpleCell
        }
        
        cell?.textLabel?.text = "@\(tweets[indexPath.row].screenName!) \(tweets[indexPath.row].name!)"
        cell?.subTitleLabel.text = tweets[indexPath.row].text!
        
        return cell!
    }
    
}

class Tweet {
    var screenName: String!
    var name: String!
    var text: String!
    
    init(screenName: String, name: String, text: String) {
        self.screenName = screenName
        self.name = name
        self.text = text
    }
}
