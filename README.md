# JomloTableView

[![CI Status](http://img.shields.io/travis/setoelkahfi/JomloTableView.svg?style=flat)](https://travis-ci.org/setoelkahfi/JomloTableView)
[![Version](https://img.shields.io/cocoapods/v/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)
[![License](https://img.shields.io/cocoapods/l/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)
[![Platform](https://img.shields.io/cocoapods/p/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8

## Installation

JomloTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JomloTableView"
```

## Usage

```swift
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
```

## Author

setoelkahfi, setoelkahfi@gmail.com

## License

JomloTableView is available under the MIT license. See the LICENSE file for more info.
