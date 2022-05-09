//
//  Playlist.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 26.08.2021.
//

import Foundation

struct Playlist: Decodable {
    
    var videoId = ""
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case resourceId
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
 }
