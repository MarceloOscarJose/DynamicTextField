# DynamicTextField
iOS Swift Dynamics text fields

![DynamicTextField: Elegant form builder in Swift](Eureka.jpg)

<p align="center">
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://cocoapods.org/pods/Eureka"><img src="https://img.shields.io/cocoapods/v/Eureka.svg" alt="CocoaPods compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/Eureka/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

## Overview

<img src="Example/Media/EurekaExample1.gif" width="220"/>
<img src="Example/Media/EurekaExample2.gif" width="220"/>
<img src="Example/Media/EurekaExample3.gif" width="220"/>

## Contents

* [Requirements]
* [Usage]
  + [Validations]
* [Installation]
* [FAQ]

## Requirements

* iOS 8.0+
* Xcode 8+
* Swift 3

### Example project

You can clone and run the Example project to see examples of most of DynamicTextField's features.

<img src="Example/Media/EurekaNavigation.gif" width="200"/>
<img src="Example/Media/EurekaRows.gif" width="200"/>

## Usage

### How to create a form
```swift
import DynamicTextField

```

You could create a form by just setting up the `form` property by yourself without extending from `FormViewController` but this method is typically more convenient.

### Operators

DynamicTextField includes custom operators to make form creation easy:

## Installation

#### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

**Cocoapods 1.1.0.rc.3 or newer version must be used.**

Specify DynamicTextField into your project's `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

pod 'DynamicTextField', '~> 1.0.1'
```

Then run the following command:

```bash
$ pod install
```
#### Manually as Embedded Framework

* Clone DynamicTextField by running the following command from your project root git folder.

```bash
$ git submodule add https://github.com/MarceloOscarJose/DynamicTextField.git
```

* Open DynamicTextField folder that was created by the previous git submodule command and drag the DynamicTextField.xcodeproj into the Project Navigator of your application's Xcode project.

* Select the DynamicTextField.xcodeproj in the Project Navigator and verify the deployment target matches with your application deployment target.

* Select your project in the Xcode Navigation and then select your application target from the sidebar. Next select the "General" tab and click on the + button under the "Embedded Binaries" section.

* Select `DynamicTextField.framework` and we are done!

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** check older issues before submitting an issue.

## Author

* [Marcelo José](https://github.com/MarceloOscarJose)

## FAQS

#### How to get the value of a row?

The value of a row can be obtained with `row.value`. The type of this value is the type of the row (i.e. the value of a `PickerRow<String>` is of type `String`).

#### How to change the bottom navigation accessory view?

To change the behaviour of this you should set the navigation options of your controller. The `FormViewController` has a `navigationOptions` variable which is an enum and can have one or more of the following values:

- **disabled**: no view at all
- **enabled**: enable view at the bottom
- **stopDisabledRow**: if the navigation should stop when the next row is disabled
- **skipCanNotBecomeFirstResponderRow**: if the navigation should skip the rows that return false to `canBecomeFirstResponder()`

The default value is `enabled & skipCanNotBecomeFirstResponderRow`

If you want to change the whole view of the bottom you will have to override the `navigationAccessoryView` variable in your subclass of `FormViewController`.

#### How to get a Row using its tag value

We can get a particular row by invoking any of the following functions exposed by the `Form` class:

```swift
public func rowBy<T: Equatable>(tag: String) -> RowOf<T>?
public func rowBy<Row: RowType>(tag: String) -> Row?
public func rowBy(tag: String) -> BaseRow?
```

For instance:

```swift
let dateRow : DateRow? = form.rowBy(tag: "dateRowTag")
let labelRow: LabelRow? = form.rowBy(tag: "labelRowTag")

let dateRow2: Row<NSDate>? = form.rowBy(tag: "dateRowTag")

let labelRow2: BaseRow? = form.rowBy(tag: "labelRowTag")
```

#### How to get a Section using its tag value

```swift
let section: Section?  = form.sectionBy(tag: "sectionTag")
```

#### How to set the form values using a dictionary

Invoking `setValues(values: [String: Any?])` which is exposed by `Form` class.

For example:

```swift
form.setValues(["IntRowTag": 8, "TextRowTag": "Hello world!", "PushRowTag": Company(name:"Xmartlabs")])
```

Where `"IntRowTag"`, `"TextRowTag"`, `"PushRowTag"` are row tags (each one uniquely identifies a row) and `8`, `"Hello world!"`, `Company(name:"Xmartlabs")` are the corresponding row value to assign.

The value type of a row must match with the value type of the corresponding dictionary value otherwise nil will be assigned.

If the form was already displayed we have to reload the visible rows either by reloading the table view `tableView.reloadData()` or invoking `updateCell()` to each visible row.

#### Row does not update after changing hidden or disabled condition

After setting a condition, this condition is not automatically evaluated. If you want it to do so immediately you can call `.evaluateHidden()` or `.evaluateDisabled()`.

This functions are just called when a row is added to the form and when a row it depends on changes. If the condition is changed when the row is being displayed then it must be reevaluated manually.

#### onCellUnHighlight doesn't get called unless onCellHighlight is also defined

Look at this [issue](https://github.com/xmartlabs/DynamicTextField/issues/96).

* [Installation]
* [FAQ]
<!--- In Project -->
[CustomCellsController]: Example/Example/ViewController.swift
[FormViewController]: Example/Source/Controllers.swift

# Change Log
This can be found in the [CHANGELOG.md](CHANGELOG.md) file.
