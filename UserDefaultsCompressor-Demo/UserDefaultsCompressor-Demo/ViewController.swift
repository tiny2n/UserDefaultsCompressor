//
//  ViewController.swift
//  UserDefaultsCompressor
//
//  Created by Choi Joongkwan on 2016. 10. 18..
//  Copyright © 2016년 Choi Joongkwan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Int { get set }
        let int: Int? = 3645
        let userDefaults = UserDefaults(suiteName: nil)
        userDefaults?.object(int, forKey: "Int")
        let intValue: Int? = userDefaults?.object(forKey: "Int")
        assert(intValue == int, "Int UserDefaultCompressor is failure")
        
        // String { set get }
        let str = "3645"
        userDefaults?.object("3645", forKey: "String")
        let strValue: String? = userDefaults?.object(forKey: "String")
        assert(strValue == str, "String UserDefaultCompressor is failure")
        
        // UIImage { get set }
        let img = UIImage(named: "image.jpeg")
        userDefaults?.object(img, forKey: "UIImage")
        let imgValue: UIImage? = userDefaults?.object(forKey: "UIImage")
        assert(imgValue?.size == img?.size, "UIImage UserDefaultCompressor is failure")
        
        // Double { get set }
        let double: Double = 3645.0
        userDefaults?.object(double, forKey: "Double")
        let doubleValue: Double? = userDefaults?.object(forKey: "Double")
        assert(doubleValue == double, "Double UserDefaultCompressor is failure")
        
        // Bool  { get set }
        let bool: Bool = true
        userDefaults?.object(bool, forKey: "Bool")
        let boolValue: Bool? = userDefaults?.object(forKey: "Bool")
        assert(boolValue == bool, "Bool UserDefaultCompressor is failure")
    }
}
