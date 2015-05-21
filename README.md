# Sweets

## About
Sweets aims to improve the usage of UIKit with Swift. Compared to other third party libraries, Sweets does not try to replace the components of UIKit, it rather extends them to make them more class aware.
This framework is still work in progress. I will gradually add new things along the way. Feel free to add things that are cumbersome to use with Swift.

[![Twitter: @larcus94](https://img.shields.io/badge/contact-@larcus94-blue.svg?style=flat)](https://twitter.com/larcus94)
[![License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://github.com/larcus94/Sweets/blob/master/LICENSE)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Author
I'm Laurin Brandner, I'm on [Twitter](https://twitter.com/larcus94).

## Example

### UIControl
```swift
func action(sender: UIControl) {
	println("by \(sender)")
}
control.setAction(action, forControlEvents: .TouchUpInside)
control.setAction(action, forControlEvents: .TouchUpOutside)

control.setAction({ sender in
	println("Hello")
}, forControlEvents: .TouchDown)

``` 

### UITableView
```swift
tableView.registerReusableCellClass(Cell.self)

let cell = tableView.dequeueReusableCell(Cell.self) // dequeues a Cell instance
let otherCell = tableView.dequeueReusableCell(OtherCell.self) // returns nil

let cell: Cell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) // returns a Cell instance
let cell: OtherCell? = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)) // returns nil
``` 

## Installation

###Carthage
```objc
github "larcus94/Sweets" ~> 0.0.1
```

## License
Sweets is licensed under the [MIT License](http://opensource.org/licenses/mit-license.php).
