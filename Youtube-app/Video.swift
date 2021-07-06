//
//  Video.swift
//  Youtube-app
//
//  Created by Laila Guzzon Hussein Lailota on 06/07/21.
//

import Foundation

struct Video: Decodable {
    
    var videoID = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case thumbnails
        case hight
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init (from decoder : Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse title, description and publish date
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // Parse thumbnails
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .hight)
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // Parse Video id
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoID = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
