# 
UserDefaults Compressor Helper in Swift ver. 3.x

[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat)](https://developer.apple.com/swift)
[![Platform](https://img.shields.io/cocoapods/p/DeepLinkSDK.svg?style=flat)](https://developer.apple.com/ios)

<h1 align="center">UserDefaultsCompressor</h1>

Overview
-------------
UserDefaults Compressor Helper using Protocol Oriented Programming<br/>

##Introduction

__Requires iOS 8 or later<br/>
__Requires Swift 3 or later<br/>

##Installation

Add the files to your project manually by dragging the UserDefaultsCompressor directory into your Xcode project.


##Usage


```swift

// Int
let int: Int? = 3645
let userDefaults = UserDefaults(suiteName: nil)
userDefaults?.object(int, forKey: "Int")
let intValue: Int? = userDefaults?.object(forKey: "Int")
assert(intValue == int, "Int UserDefaultCompressor is failure")

// String
let str = "3645"
userDefaults?.object(str, forKey: "String")
let strValue: String? = userDefaults?.object(forKey: "String")
assert(strValue == str, "String UserDefaultCompressor is failure")

// UIImage
let img = UIImage(named: "image.jpeg")
userDefaults?.object(img, forKey: "UIImage")
let imgValue: UIImage? = userDefaults?.object(forKey: "UIImage")
assert(imgValue?.size == img?.size, "UIImage UserDefaultCompressor is failure")

// Double
let double: Double = 3645.0
userDefaults?.object(double, forKey: "Double")
let doubleValue: Double? = userDefaults?.object(forKey: "Double")
assert(doubleValue == double, "Double UserDefaultCompressor is failure")

// Bool
let bool: Bool = true
userDefaults?.object(bool, forKey: "Bool")
let boolValue: Bool? = userDefaults?.object(forKey: "Bool")
assert(boolValue == bool, "Bool UserDefaultCompressor is failure")

```

<br>

```swift
// Inheritance Protocol 'IUserDefaultsCompressor'
extension CustomObject: IUserDefaultsCompressor {
    public func compress() -> Data? {
        return // convert CustomObject to Data
    }
    
    public static func extract(compressed: Data?) -> CustomObject? {
        if let compressed = compressed {
            return // convert Data to CustomObject
        }
        
        return nil
    }
}

// ex) UIImage
extension UIImage: IUserDefaultsCompressor {
    public func compress() -> Data? {
        return UIImagePNGRepresentation(self)
    }
    
    public static func extract(compressed: Data?) -> UIImage? {
        if let compressed = compressed {
            return UIImage(data: compressed)
        }
        
        return nil
    }
}

```
<br>

The MIT License (MIT)

Copyright (c) 2016 Choi Joongkwan. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
