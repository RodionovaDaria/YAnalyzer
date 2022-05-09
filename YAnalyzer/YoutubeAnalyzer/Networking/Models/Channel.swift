//
//  Channel.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 26.07.2021.
//

import Foundation

struct Channel: Decodable {
    
    var title = ""
    var description = ""
    var country:String? = "none"
    var publishedAt = ""
    var viewCount: Int?
    var subscriberCount:String? = "none"
    var videoCount: Int?
    
    var uploads = ""
    
    
    enum CodingKeys: String, CodingKey {
        case items
        case snippet
        case statistics
        case contentDetails
        
        case title
        case description
        case country
        case publishedAt
        case viewCount
        case subscriberCount
        case videoCount
        
        case relatedPlaylists
        case uploads
    }
    
    init(from decoder: Decoder) throws {
     let container = try decoder.container(keyedBy: CodingKeys.self)
      
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.country = try snippetContainer.decodeIfPresent(String?.self, forKey: .country) ?? "Country is hidden"
        
        self.publishedAt = try snippetContainer.decode(String.self, forKey: .publishedAt)
        
        
        let statisticsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .statistics)
         
        //self.viewCount = try statisticsContainer.decode(String.self, forKey: .viewCount)
        
        let viewCount = try (statisticsContainer.decodeIfPresent(String?.self, forKey: .viewCount) ?? "0")
        
        self.viewCount = Int(viewCount ?? "0")
        
        
        self.subscriberCount = try statisticsContainer.decodeIfPresent(String.self, forKey: .subscriberCount) ?? "Subscribers are hidden"
    
        //self.videoCount = try statisticsContainer.decode(String.self, forKey: .videoCount)
        
        let videoCount = try (statisticsContainer.decodeIfPresent(String?.self, forKey: .videoCount) ?? "0")
        
        self.videoCount = Int(videoCount ?? "0")
        
        let contentDetailsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .contentDetails)
        
        let relatedPlaylistsContainer = try contentDetailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .relatedPlaylists)
        
        self.uploads = try relatedPlaylistsContainer.decode(String.self, forKey: .uploads)
    }
}
