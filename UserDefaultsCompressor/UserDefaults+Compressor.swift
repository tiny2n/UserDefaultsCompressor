//
//  UserDefaultsCompressor.swift
//  UserDefaultsCompressor
//
//  Created by Choi Joongkwan on 2016. 10. 18..
//  Copyright © 2016년 Choi Joongkwan. All rights reserved.
//

import Foundation

public protocol IUserDefaultsCompressor {
    associatedtype CompressorCompress
    associatedtype CompressorExtract
    
    func compress() -> CompressorCompress?
    static func extract(compressed: CompressorCompress?) -> CompressorExtract?
}


extension UserDefaults {
    open func object<T: IUserDefaultsCompressor>(_ value: T?, forKey: String) {
        let compress = value?.compress()
        set(compress, forKey: forKey)
    }
    
    open func object<T: IUserDefaultsCompressor>(forKey: String) -> T? {
        return extract(forKey: forKey)
    }
    
    private func extract<T: IUserDefaultsCompressor>(forKey: String) -> T? {
        let compressed = object(forKey: forKey) as? T.CompressorCompress
        return extract(compressed: compressed)
    }
    
    private func extract<T: IUserDefaultsCompressor>(compressed: T.CompressorCompress?) -> T? {
        let result = T.extract(compressed: compressed)
        return result as? T
    }
}
