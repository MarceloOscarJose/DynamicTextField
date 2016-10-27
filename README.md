# DynamicTextField
iOS Swift Dynamics text fields

![DynamicTextField: Elegant form builder in Swift](Eureka.jpg)

<p align="center">
<a href="https://travis-ci.org/xmartlabs/Eureka"><img src="https://travis-ci.org/xmartlabs/Eureka.svg?branch=master" alt="Build status" /></a>
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift3-compatible-4BC51D.svg?style=flat" alt="Swift 3 compatible" /></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://cocoapods.org/pods/Eureka"><img src="https://img.shields.io/cocoapods/v/Eureka.svg" alt="CocoaPods compatible" /></a>
<a href="https://raw.githubusercontent.com/xmartlabs/Eureka/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
<a href="https://codebeat.co/projects/github-com-xmartlabs-eureka"><img alt="codebeat badge" src="https://codebeat.co/badges/16f29afb-f072-4633-9497-333c6eb71263" /></a>
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

**For more information look at [our blog post] that introduces *Eureka*.**

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
By extending `FormViewController` you can then simply add sections and rows to the `form` variable.

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

pod 'DynamicTextField', '~> 2.0.0-beta.1'
```

Then run the following command:

```bash
$ pod install
```
#### Manually as Embedded Framework

* Clone Eureka as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command from your project root git folder.

```bash
$ git submodule add https://github.com/xmartlabs/Eureka.git
```

* Open DynamicTextField folder that was created by the previous git submodule command and drag the DynamicTextField.xcodeproj into the Project Navigator of your application's Xcode project.

* Select the DynamicTextField.xcodeproj in the Project Navigator and verify the deployment target matches with your application deployment target.

* Select your project in the Xcode Navigation and then select your application target from the sidebar. Next select the "General" tab and click on the + button under the "Embedded Binaries" section.

* Select `DynamicTextField.framework` and we are done!

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** check older issues before submitting an issue.
* If you **need help** or would like to **ask general question**, use [StackOverflow]. (Tag `eureka-forms`).

**Before contribute check the [CONTRIBUTING](CONTRIBUTING.md) file for more info.**

If you use **DynamicTextField** in your app We would love to hear about it! Drop us a line on [twitter].

## Authors

* [Martin Barreto](https://github.com/mtnBarreto) ([@mtnBarreto](https://twitter.com/mtnBarreto))
* [Mathias Claassen](https://github.com/mats-claassen) ([@mClaassen26](https://twitter.com/mClaassen26))

## FAQ

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

#### How to update a Section header/footer

* Set up a new header/footer data ....

```swift
section.header = "Header Title" // use string literal as a header/footer data. HeaderFooterView conforms to ExpressibleByStringLiteral.
//or
section.header = HeaderFooterView(title: "Header title \(variable)") // use String interpolation
//or
var header = HeaderFooterView<UIView>(.class) // most flexible way to set up a header using any view type
header.height = { 60 }  // height can be calculated
header.onSetupView = { view, section in  // each time the view is about to be displayed onSetupView is invoked.
    view.backgroundColor = .orange
}
section.header = header
```

* Reload the Section to perform the changes

```swift
section.reload()
```

These methods are used internally to implement the custom operators as shown bellow:

```swift
public func +++(left: Form, right: Section) -> Form {
    left.append(right)
    return left
}

public func +=< C : Collection where C.Generator.Element == Section>(inout lhs: Form, rhs: C){
    lhs.appendContentsOf(rhs)
}

public func <<<(left: Section, right: BaseRow) -> Section {
    left.append(right)
    return left
}

public func +=< C : Collection where C.Generator.Element == BaseRow>(inout lhs: Section, rhs: C){
    lhs.appendContentsOf(rhs)
}
```

You can see how the rest of custom operators are implemented [here](https://github.com/xmartlabs/Eureka/blob/master/Source/Core/Operators.swift).

It's up to you to decide if you want to use DynamicTextField custom operators or not.

<!--- In file -->
[Introduction]: #introduction
[Requirements]: #requirements

[How to create a Form]: #how-to-create-a-form
[How to get the form values]: #how-to-get-the-form-values
[Examples]: #examples
[Usage]: #usage
[Operators]: #operators
[Rows]: #rows
[Using the callbacks]: #using-the-callbacks
[Section Header and Footer]: #section-header-and-footer
[Custom rows]: #custom-rows
[Basic custom rows]: #basic-custom-rows
[Custom inline rows]: #custom-inline-rows
[Custom presenter rows]: #custom-presenter-rows
[How to create custom inline rows]: #how-to-create-custom-inline-rows
[Custom rows catalog]: #custom-rows-catalog
[Dynamically hide and show rows (or sections)]: #hide-show-rows
[Implementing a custom Presenter row]: #custom-presenter-row
[Extensibility]: #extensibility
[Row catalog]: #row-catalog
[Installation]: #installation
[FAQ]: #faq

[List sections]: #list-sections
[Validations]: #validations

* [Installation]
* [FAQ]


<!--- In Project -->
[CustomCellsController]: Example/Example/ViewController.swift
[FormViewController]: Example/Source/Controllers.swift

<!--- External -->
[XLForm]: https://github.com/xmartlabs/XLForm
[DSL]: https://en.wikipedia.org/wiki/Domain-specific_language
[StackOverflow]: http://stackoverflow.com/questions/tagged/eureka-forms
[our blog post]: http://blog.xmartlabs.com/2015/09/29/Introducing-Eureka-iOS-form-library-written-in-pure-Swift/
[twitter]: https://twitter.com/xmartlabs
[EurekaCommunity]: https://github.com/EurekaCommunity

# Change Log

This can be found in the [CHANGELOG.md](CHANGELOG.md) file.