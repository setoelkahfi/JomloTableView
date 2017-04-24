# JomloTableView

[![Version](https://img.shields.io/cocoapods/v/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)
[![License](https://img.shields.io/cocoapods/l/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)
[![Platform](https://img.shields.io/cocoapods/p/JomloTableView.svg?style=flat)](http://cocoapods.org/pods/JomloTableView)

An iOS UITableView with detachable section and row. Use single section with multiple rows, or multiple sections with multiple rows.
Conforming UITableViewDelegate and UITableViewDataSource in every view controller is a mundane and repetitive task. Move the delegate and the data source directly to the table view, and supply the table with section(s) and row(s). Free yourself from Massive-View-Controller.

Reference: https://goo.gl/zTGfpi, https://goo.gl/7vMbSF

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
```shell
git clone https://github.com/setoelkahfi/JomloTableView
cd Example
pod install
```


## Requirements

iOS 8

## Installation

JomloTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JomloTableView"
```

## Usage
### Simple usage
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
        row0.setOnRowClicked { (row) in
            self.performSegue(withIdentifier: "showSimpleTableViewExample", sender: self)
        }
        exampleSection.addRow(row: row0)

        let row1 = SimpleRow("Load more", subTitle: "A JomloTableView with load more row at the bottom. Will load infinite row if we scroll the table view to the bottom.")
        row1.setOnRowClicked { (row) in
            self.performSegue(withIdentifier: "showLoadMoreExample", sender: self)
        }
        exampleSection.addRow(row: row1)

        // Another rows to add

        jomloTableView.addSection(section: exampleSection)
        jomloTableView.reloadData()

    }

// Another code
```
The row
```swift
import UIKit
import JomloTableView

class SimpleCell: JomloTableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subTitleLabel: UILabel!

}

class SimpleRow: JomloTableViewRow {

    var title: String!
    var subTitle: String!

    init(_ title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
    }

    override var identifier: String {
        return "SimpleCell"
    }

    override var rowHeight: CGFloat {
        return UITableViewAutomaticDimension
    }

    override var estimatedRowHeight: CGFloat {
        return 64
    }

    override func populateView(cell: JomloTableViewCell) {
        let cell = cell as! SimpleCell
        cell.titleLabel.text = title
        cell.subTitleLabel.text = subTitle
    }
}

```
<img src="https://raw.githubusercontent.com/setoelkahfi/JomloTableView/release-0.2.0/images/example-rows-0.png" width="220" height="400" title="Example rows 2"/>&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/setoelkahfi/JomloTableView/release-0.2.0/images/example-rows-1.png" width="220" height="400" title="Example rows 2"/>

### Load more row
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
<img src="https://raw.githubusercontent.com/setoelkahfi/JomloTableView/release-0.2.0/images/example-load-more-0.png" width="220" height="400" title="Example load more rows 1"/>&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/setoelkahfi/JomloTableView/release-0.2.0/images/example-load-more-1.png" width="220" height="400" title="Example load more rows 2"/>&nbsp;&nbsp;&nbsp;<img src="https://raw.githubusercontent.com/setoelkahfi/JomloTableView/release-0.2.0/images/example-load-more-2.png" width="200" height="400" title="Example load more rows 3"/>

## Author

Seto Elkahfi, setoelkahfi@gmail.com

## License

JomloTableView is available under the MIT license. See the LICENSE file for more info.
