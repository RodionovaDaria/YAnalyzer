//
//  Video3.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 20.09.2021.
//

import Foundation

struct Videos: Decodable {
    
    var publishedAt = ""
    var title = ""
    var viewCount: Int
    var likeCount: Int?
    var dislikeCount: Int = 0
    var commentCount: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case snippet
        case publishedAt
        case title
        
        case statistics
        case viewCount
        case likeCount
        case dislikeCount
        case commentCount
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.publishedAt = try snippetContainer.decode(String.self, forKey: .publishedAt)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)

        
        let statisticsContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .statistics)
        
        guard let viewCount = Int(try statisticsContainer.decode(String.self, forKey: .viewCount)) else {
                    fatalError("The viewCount is not an Int")
                }
        self.viewCount = viewCount
        
       // self.country = try snippetContainer.decodeIfPresent(String?.self, forKey: .country) ?? "No country"
        
      
        let likeCount = try (statisticsContainer.decodeIfPresent(String?.self, forKey: .likeCount) ?? "0")
        
        self.likeCount = Int(likeCount ?? "0")
        
        let commentCount = try (statisticsContainer.decodeIfPresent(String?.self, forKey: .commentCount) ?? "0")
        
        self.commentCount = Int(commentCount ?? "0")
     
    }

}
