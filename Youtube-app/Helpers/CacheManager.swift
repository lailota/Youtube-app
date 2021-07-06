//
//  CacheManager.swift
//  Youtube-app
//
//  Created by Laila Guzzon Hussein Lailota on 06/07/21.
//

import Foundation

class CacheManager {
    
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
