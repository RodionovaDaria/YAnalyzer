//
//  VideosTableViewCell.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 10.03.2022.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: LabelWithInsets!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    private func setupCell() {
        
        titleLabel.font = Style.boldBaseLabelFont
        titleLabel.textColor = .systemOrange
        
        descriptionLabel.backgroundColor = .systemGray6
        descriptionLabel.contentInsets = UIEdgeInsets(top: 10,
                                                      left: 10,
                                                      bottom: 10,
                                                      right: 10)
        descriptionLabel.layer.cornerRadius = 10.0
    }
    
    func configureCell(_ videoStatistics: VideoStatistics) {
        
        titleLabel.text = "\(videoStatistics.video.title)"
        
        let resultAttributedString = NSMutableAttributedString()
        
        let dateAttributes = [
            NSAttributedString.Key.font: Style.boldBaseLabelFont
        ]
        
        let descriptionAttributes = [
            NSAttributedString.Key.font: Style.regularBaseLabelFont
        ]
        
        let dateAttrString = NSAttributedString(
            string: "\(videoStatistics.dateRepresentation)\n\n",
            attributes: dateAttributes)
        resultAttributedString.append(dateAttrString)

        let viewsAttrString = NSAttributedString(
            string: "\(videoStatistics.videosViewsPercentStrings)\n",
            attributes: descriptionAttributes)
        resultAttributedString.append(viewsAttrString)

        let likesAttrString = NSAttributedString(
            string: "\(videoStatistics.videosLikesPercentStrings)\n",
            attributes: descriptionAttributes)
        resultAttributedString.append(likesAttrString)
        
        let commentsAttrString = NSAttributedString(
            string: "\(videoStatistics.videosCommentsPercentStrings)",
            attributes: descriptionAttributes)
        resultAttributedString.append(commentsAttrString)
        
        descriptionLabel.attributedText = resultAttributedString
    }
}
