//
//  Responses.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 30.07.2021.
//

import Foundation

struct ChannelResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case items
    }
   
    var items: [Channel]?
    
    init (from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Channel].self, forKey: .items)
    }
}

struct PlaylistResponse: Decodable {
   
   enum CodingKeys:String, CodingKey {
       case items
   }
  
   var items: [Playlist]?
   
   init (from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       
       self.items = try container.decode([Playlist].self, forKey: .items)
   }
}

struct VideosResponse: Decodable {
   
   enum CodingKeys:String, CodingKey {
       case items
   }
  
   var items: [Videos]?
   
   init (from decoder: Decoder) throws {
       let container = try decoder.container(keyedBy: CodingKeys.self)
       
       self.items = try container.decode([Videos].self, forKey: .items)
   }
}
