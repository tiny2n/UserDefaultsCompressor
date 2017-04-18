//
//  UIImage+IUserDefaultsCompressor.swift
//  UserDefaultsCompressor
//
//  Created by Choi Joongkwan on 2016. 10. 18..
//  Copyright © 2016년 Choi Joongkwan. All rights reserved.
//

import Foundation
import UIKit

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
