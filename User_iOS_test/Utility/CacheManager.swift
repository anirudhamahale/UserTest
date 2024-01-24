//
//  CacheManager.swift
//  User_iOS_test
//
//  Created by Anirudha Mahale on 23/01/24.
//

import Foundation

class CacheManager {
    
    // Marking the init private in order to prevent creation of object.
    private init() { }
    
    private let cache = NSCache<NSURL, NSData>()
    
    static let shared = CacheManager()
    
    func cacheImage(data: NSData, url: NSURL) {
        cache.setObject(data, forKey: url)
    }
    
    func getData(for url: NSURL) -> NSData? {
        return cache.object(forKey: url)
    }
}
