# JomloTableView

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

Use single section with multiple rows. All the rows below are from single class.
```swift
import UIKit
import JomloTableView

// Another code

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

// Another code
```
![Example rows 1](/../release-0.2.0/images/example-rows-0.png?raw=true "Example rows 1")
![Example rows 2](/../release-0.2.0/images/example-rows-1.png?raw=true "Example rows 2")

This table view will load more row if loadMoreRow is populated. This example will load infinite rows if user scroll to bottom of table view. Eight rows per each load.
```swift
import UIKit
import JomloTableView

// Another code

    @IBOutlet var jomloTableView: JomloTableView!

    let tableSection = JomloTableViewSection()

    override func viewDidLoad() {
        super.viewDidLoad()

        jomloTableView.addSection(section: tableSection)
        addRows()
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

// Another code

```
![Example load more row 1](/../release-0.2.0/images/example-load-more-0.png?raw=true "Example load more row 1")
![Example load more row 2](/../release-0.2.0/images/example-load-more-1.png?raw=true "Example load more row 2")
![Example load more row 3](/../release-0.2.0/images/example-load-more-2.png?raw=true "Example load more row 3")

## Author

Seto Elkahfi, setoelkahfi@gmail.com

## License

JomloTableView is available under the MIT license. See the LICENSE file for more info.
