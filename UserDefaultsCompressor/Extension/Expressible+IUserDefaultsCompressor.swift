//
//  LiteralType+IUserDefaultsCompressor.swift
//  UserDefaultsCompressor
//
//  Created by Choi Joongkwan on 2016. 10. 18..
//  Copyright © 2016년 Choi Joongkwan. All rights reserved.
//

import Foundation

// Integer
extension ExpressibleByIntegerLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Self? {
        return self
    }
    
    public static func extract(compressed: Self?) -> Self? {
        return compressed
    }
}

extension Int: IUserDefaultsCompressor { }
extension Int64: IUserDefaultsCompressor { }
extension Int32: IUserDefaultsCompressor { }
extension Int16: IUserDefaultsCompressor { }
extension Int8: IUserDefaultsCompressor { }
extension UInt: IUserDefaultsCompressor { }
extension UInt64: IUserDefaultsCompressor { }
extension UInt32: IUserDefaultsCompressor { }
extension UInt16: IUserDefaultsCompressor { }
extension UInt8: IUserDefaultsCompressor { }

// Boolean
extension ExpressibleByBooleanLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Self? {
        return self
    }
    
    public static func extract(compressed: Self?) -> Self? {
        return compressed
    }
}

extension Bool: IUserDefaultsCompressor { }

extension Float: IUserDefaultsCompressor { }    // same Float32
extension Double: IUserDefaultsCompressor { }   // same Float64

// String
extension ExpressibleByStringLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Self? {
        return self
    }
    
    public static func extract(compressed: Self?) -> Self? {
        return compressed
    }
}

extension String: IUserDefaultsCompressor { }

extension Data: IUserDefaultsCompressor {
    public func compress() -> Data? {
        return self
    }
    
    public static func extract(compressed: Data?) -> Data? {
        return compressed
    }
}

// Nil
extension ExpressibleByNilLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Self? {
        return self
    }
    
    public static func extract(compressed: Self?) -> Self? {
        return compressed
    }
}

extension Optional where Wrapped: IUserDefaultsCompressor {
    public func compress() -> Optional? {
        return self
    }
    
    public static func extract(compressed: Optional?) -> Optional? {
        return compressed
    }
}

// Array
extension ExpressibleByArrayLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Data? {
        return NSKeyedArchiver.archivedData(withRootObject: self)
    }
    
    public static func extract(compressed: Data?) -> Self? {
        if let compressed = compressed {
            return NSKeyedUnarchiver.unarchiveObject(with: compressed) as? Self
        }
        
        return nil
    }
}

extension Array: IUserDefaultsCompressor { }

// Dictionary
extension ExpressibleByDictionaryLiteral where Self: IUserDefaultsCompressor {
    public func compress() -> Self? {
        return self
    }
    
    public static func extract(compressed: Self?) -> Self? {
        return compressed
    }
}

extension Dictionary: IUserDefaultsCompressor { }
