# RWDraggableMenu

[![CI Status](http://img.shields.io/travis/Raditya Kurnianto/RWDraggableMenu.svg?style=flat)](https://travis-ci.org/Raditya Kurnianto/RWDraggableMenu)
[![Version](https://img.shields.io/cocoapods/v/RWDraggableMenu.svg?style=flat)](http://cocoapods.org/pods/RWDraggableMenu)
[![License](https://img.shields.io/cocoapods/l/RWDraggableMenu.svg?style=flat)](http://cocoapods.org/pods/RWDraggableMenu)
[![Platform](https://img.shields.io/cocoapods/p/RWDraggableMenu.svg?style=flat)](http://cocoapods.org/pods/RWDraggableMenu)


RWDraggableMenu is a draggable button with iOS assistive touch behavior. It can expand and collapse to reveal the menus. RWDraggableMenu is a subclass of UIView.

## Usage

### Podfile
To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Implementation
Use this line to import the RWDraggable menu `#import "RWDraggableMenu.h"` then instantiate the class using the following command :

```objective-c
// Supplied a set of icon for you draggable menu`
NSArray *iconsArray = @[@"drag-icon", @"comment-icon", @"share-icon", @"copy-icon", @"bookmark-icon"];`

// Create the draggable menu and add it as a subview
RWDraggableMenu * dragMenu = [[RWDraggableMenu alloc] init];
dragMenu.delegate = self;
[self.view addSubview:[dragMenu setupDragMenuInView:self.view width:70 height:70 backgroundColorRed:51/255.0 green:102/255.0 blue:153/255.0 alpha:0.5 icons:iconsArray]];
```


## Screenshots

<p align="center" >
<img src="https://github.com/radityaK/RWDraggableMenu/blob/master/Simulator%20Screen%20Shot%20Dec%2020%2C%202016%2C%201.44.34%20PM.png" width=320 height=569 alt="Screenshot 1" title="Screenshot 1">
<img src="https://github.com/radityaK/RWDraggableMenu/blob/master/Simulator%20Screen%20Shot%20Dec%2020%2C%202016%2C%201.44.38%20PM.png" width=320 height=569 alt="Screenshot 2" title="Screenshot 2">
</p>

## Requirements

iOS 7+

## Installation

RWDraggableMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RWDraggableMenu"
```

## Author

Raditya Kurnianto, raditya.kurnianto@gmail.com

## License

RWDraggableMenu is available under the MIT license. See the LICENSE file for more info.
