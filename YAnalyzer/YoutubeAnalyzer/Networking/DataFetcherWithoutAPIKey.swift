//
//  DataFetcher.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 30.09.2021.
//

import Foundation

 class DataFetcher {
    
    private var apiKey: String = "YOUR API KEY"
    
    private var baseApiPath: String = "https://youtube.googleapis.com/youtube/v3/"
    
    private enum APIResource: String {
        case channelInfo = "channels?part=snippet%2CcontentDetails%2Cstatistics"
        case playlistItems = "playlistItems?part=snippet"
        case videos = "videos?part=snippet%2CcontentDetails%2Cstatistics"
    }
    
    private func getApiPath(for resource: APIResource) -> String {
        return "\(baseApiPath)\(resource.rawValue)&key=\(apiKey)"
    }
    
    func getChannelInfo(for channelId: String,
                        completion: @escaping (_ channels: [Channel], _ error: String?) -> ()) {
        
        let apiPath = getApiPath(for: .channelInfo) + "&id=" + channelId
        
        guard let url = URL(string: apiPath) else {
            return
        }
        
        print("getChannelInfo url: \(url)")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
    
            guard let data = data,
                  let response = response else {
                //print("error: \(error)")
                return
            }
            
            print("getChannelInfo data: \(data)")
            print("getChannelInfo response: \(response)")
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
            
                let response = try decoder.decode(ChannelResponse.self, from: data)
            
                if let items = response.items {
                    completion(items, nil)
                }
                
                print("@@@ SUCEESS")
                //dump(response)
                
            } catch {
                
                print("@@@ ERROR \(error)")
                completion([], error.localizedDescription)
            }
            
        }
        
        dataTask.resume()
    }
    
    func getPlaylistItemsInfo(for playlist: String,
                              numberOfVideos: Int,
                              completion: @escaping ([Playlist]) -> ()) {
        
        
        //let playlistId = getEntityIdentifier(for: playlist)
       
        let apiPath = getApiPath(for: .playlistItems) + "&maxResults=" + "\(numberOfVideos)" + "&playlistId=" + playlist
        
        
                
        guard let url = URL(string: apiPath) else {
            return
        }
        
        print("url2: \(url)")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
    
            guard let data = data,
                  let response = response else {
                //print("error: \(error)")
                return
            }
            
            print("data2: \(data)")
            print("response2: \(response)")
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
            
                let response = try decoder.decode(PlaylistResponse.self, from: data)
            
                if let items = response.items {
                    completion(items)
                }
                
                print("@@@ SUCEESS")
                //dump(response)
                
            } catch {
                print("@@@ ERROR \(error)")
            }
            
        }
        
        dataTask.resume()
    }
    
    func getVideosInfo(for videos: [String],
                       completion: @escaping ([Videos]) -> ()) {
       
        var apiPath = getApiPath(for: .videos)
        
        for element in videos {
            apiPath = apiPath + "&id=" + element
        }
        
        guard let url = URL(string: apiPath) else {
            return
        }
        print("urlARRAY: \(videos)")
        print("url3: \(url)")
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
    
            guard let data = data,
                  let response = response else {
                //print("error: \(error)")
                return
            }
            
            print("data3: \(data)")
            print("response3: \(response)")
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
            
                let response = try decoder.decode(VideosResponse.self, from: data)
            
                if let items = response.items {
                    completion(items)
                }
                
                print("@@@ SUCEESS")
                //dump(response)
                
            } catch {
                print("@@@ ERROR \(error)")
            }
            
        }
        
        dataTask.resume()
    }
    
    
}
