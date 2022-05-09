//
//  StatisticsCalculation.swift
//  NoName
//
//  Created by Dasha on 22.09.2021.
//

import Foundation

struct VideoStatistics {
    
    var video: Videos
    var videosViewsPercentStrings: String
    var videosLikesPercentStrings: String
    var videosDislikesPercentStrings: String
    var videosCommentsPercentStrings: String
    var dateRepresentation: String
}

class StatisticsCalculator {
    
    private let dateFormatterToGetData: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()
    
    private let dateFormatterToGetString: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy. HH:mm:ss"
        return dateFormatter
    }()
    
    func getVideosStatistics(videos: [Videos]) -> [VideoStatistics] {
       
        var result: [VideoStatistics] = []
        
        var totalViews: Int = 0
        var totalLikes: Int = 0
        var totalDislikes: Int = 0
        var totalComments: Int = 0
        var totalViewsArray: [Int] = []
        var totalLikesArray: [Int] = []
        var totalDislikesArray: [Int] = []
        var totalCommentsArray: [Int] = []
        var averageViews: Int = 0
        var averageLikes: Int = 0
        var averageDislikes: Int = 0
        var averageComments: Int = 0

        for video in videos {
            totalViews += video.viewCount
            totalLikes += video.likeCount!
            totalDislikes += video.dislikeCount
            totalComments += video.commentCount!
            averageViews = totalViews / videos.count
            averageLikes = totalLikes / videos.count
            averageDislikes = totalDislikes / videos.count
            averageComments = totalComments / videos.count
            totalViewsArray.append(video.viewCount)
            totalLikesArray.append(video.likeCount!)
            totalDislikesArray.append(video.dislikeCount)
            totalCommentsArray.append(video.commentCount!)
        }
        
        for video in videos {
            
            var viewsPercent: Double
            var likesPercent: Double
            var dislikesPercent: Double
            var commentsPercent: Double
            var viewsDescription = ""
            var likesDescription = ""
            var dislikesDescription = ""
            var commentsDescription = ""
            
            viewsPercent = (Double(video.viewCount) / Double(totalViews))*100
            let roundedViewsPercent = round(viewsPercent * 100) / 100.0
            
            if video.viewCount == totalViewsArray.max() {
                
                viewsDescription = ("🥇Views: \(video.viewCount) \n\(roundedViewsPercent)% of all views for this period. Most viewed video!")
            } else if video.viewCount == totalViewsArray.min() {
                viewsDescription = ("📉Views: \(video.viewCount) \n\(roundedViewsPercent)% of all views for this period. Least of all viewed video.")
            } else if video.viewCount < averageViews || video.viewCount == averageViews  {
                viewsDescription = ("Views: \(video.viewCount) \n\(roundedViewsPercent)% of all views for this period. Worse then average.")
            } else {
                viewsDescription = ("Views: \(video.viewCount) \n\(roundedViewsPercent)% of all views for this period. Beter then average.")
            }
            
            likesPercent = (Double(video.likeCount!) / Double(totalLikes))*100
            let roundedLikesPercent = round(likesPercent * 100) / 100.0
            
            if video.likeCount == totalLikesArray.max() {
                
                likesDescription = ("🥇Likes: \(video.likeCount ?? 0) \n\(roundedLikesPercent)% of all likes for this period. Most liked video!")
            } else if video.likeCount == totalLikesArray.min() {
                likesDescription = ("📉Likes: \(video.likeCount ?? 0) \n\(roundedLikesPercent)% of all likes for this period. Least of all liked video.")
            } else if video.likeCount! < averageLikes || video.likeCount == averageLikes  {
                likesDescription = ("Likes: \(video.likeCount ?? 0) \n\(roundedLikesPercent)% of all likes for this period. Worse then average.")
            } else {
                likesDescription = ("Likes: \(video.likeCount ?? 0) \n\(roundedLikesPercent)% of all likes for this period. Beter then average.")
            }
            
            dislikesPercent = (Double(video.dislikeCount) / Double(totalDislikes))*100
            let roundedDislikesPercent = round(dislikesPercent * 100) / 100.0
            
            if video.dislikeCount == totalDislikesArray.max() {
                dislikesDescription = ("🥇Dislikes: \(video.dislikeCount) \n\(roundedDislikesPercent)% of all dislikes for this period. Most disliked video!")
            } else if video.dislikeCount == totalDislikesArray.min() {
                dislikesDescription = ("📉Dislikes: \(video.dislikeCount) \n\(roundedDislikesPercent)% of all dislikes for this period. Least of all disliked video.")
            } else if video.dislikeCount < averageDislikes || video.dislikeCount == averageLikes  {
                dislikesDescription = ("Dislikes: \(video.dislikeCount) \n\(roundedDislikesPercent)% of all dislikes for this period. Worse then average.")
            } else {
                dislikesDescription = ("Dislikes: \(video.dislikeCount) \n\(roundedDislikesPercent)% of all dislikes for this period. Beter then average.")
            }
            
            commentsPercent = (Double(video.commentCount!) / Double(totalComments))*100
            let roundedCommentsPercent = round(commentsPercent * 100) / 100.0
            
            if video.commentCount == totalCommentsArray.max() {
                commentsDescription = ("🥇Comments: \(video.commentCount ?? 0) \n\(roundedCommentsPercent)% of all comments for this period. Most commented video!")
            } else if video.commentCount == totalCommentsArray.min() {
                commentsDescription = ("📉Comments: \(video.commentCount ?? 0) \n\(roundedCommentsPercent)% of all comments for this period. Least of all commented video.")
            } else if video.commentCount! < averageComments || video.dislikeCount == averageComments  {
                commentsDescription = ("Comments: \(video.commentCount ?? 0) \n\(roundedCommentsPercent)% of all comments for this period. Worse then average.")
            } else {
                commentsDescription = ("Comments: \(video.commentCount ?? 0) \n\(roundedCommentsPercent)% of all comments for this period. Beter then average.")
            }
            
            // Creating date representation
            
            var dateRepresentation: String = ""
            if let date = dateFormatterToGetData.date(from: video.publishedAt) {
                dateRepresentation = dateFormatterToGetString.string(from: date)
            }
            
            let videoStatistics = VideoStatistics(video: video,
                                                  videosViewsPercentStrings: viewsDescription,
                                                  videosLikesPercentStrings: likesDescription,
                                                  videosDislikesPercentStrings: dislikesDescription,
                                                  videosCommentsPercentStrings: commentsDescription,
                                                  dateRepresentation: dateRepresentation)
            result.append(videoStatistics)
        }
        
        return result
        
    }
    
}
