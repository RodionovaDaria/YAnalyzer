//
//  ChannelInfoViewController.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 25.07.2021.
//

import UIKit

class ChannelInfoViewController: UIViewController {
    
    private var channelId: String?
    private var dataFetcher: DataFetcher?
    private var customNumberOfVideos: Int?
    private var playlistId: String?
    private var videosId: String?
    private var channel: Channel?
    
    private let dateFormatterToGetData: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        return dateFormatter
    }()
    
    private let dateFormatterToGetString: DateFormatter = {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d, yyyy"
        return dateFormatter
    }()
    
    @IBOutlet private weak var descriptionScrollView: UIScrollView!
    
    @IBOutlet private weak var channelDescription: UILabel!
    
    @IBOutlet private weak var sliderLabel: UILabel!
    
    @IBOutlet private weak var slider: UISlider!
    
    @IBOutlet private weak var showStatisticsButton: RoundedButton!
    
    @IBAction private func sliderValueChanged(_ sender: UISlider) {
        
        customNumberOfVideos = Int(sender.value)
        sliderLabel.font = Style.mediumBaseLabelFont
        sliderLabel.textColor = .systemOrange
        sliderLabel.text = "Number of videos to display: \(customNumberOfVideos!)"
    }
    
    @IBAction private func showStatisticsButtonTapped(_ sender: UIButton!) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let appearingViewController = storyBoard.instantiateViewController(identifier: "videosVC") as? VideosDetailsViewController else {
            return
        }
        
        guard let dataFetcher = dataFetcher, let playlistId = playlistId else {
            return
        }
        
        appearingViewController.configureVideosVC(playlistId: playlistId, dataFetcher: dataFetcher, customNumberOfVideos: customNumberOfVideos ?? 50)
        
        self.navigationController?.pushViewController(appearingViewController, animated: true)
    }
    
    func configureChannelVC(dataFetcher: DataFetcher, channel: Channel) {
        
        self.dataFetcher = dataFetcher
        self.channel = channel
    }
    
    private func setupScrollView() {
        
        var numberOfCharacters = 0
        if self.channel?.description != nil {
            numberOfCharacters = self.channel!.description.count
        }
        
        if numberOfCharacters < 200 {
            self.descriptionScrollView.isScrollEnabled = false
        }
        else {
            self.descriptionScrollView.isScrollEnabled = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupChannelInfo()
    }
    
    private func setupView() {
        
        setupNavigationController()
        
        setupScrollView()
        
        sliderLabel.font = Style.mediumBaseLabelFont
        sliderLabel.textColor = .systemOrange
        sliderLabel.text = "Select the number of videos"
        showStatisticsButton.buttonStyle = .inversed
    }
    
    private func setupChannelInfo() {
        guard let channel = channel else {
            return
        }
        
        let country = Country.init(rawValue: channel.country ?? "ZZ")
        let flag: String = Country.flag(country: country)
        self.playlistId = channel.uploads
        self.channelDescription.attributedText = channelInfo(for: channel)
        title = "\(channel.title) \(flag)"
    }
    
    private func setupNavigationController() {
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: Style.navigationBarLargeTitleText,NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: Style.navigationBartitleTextAttributes], for: .normal)
    }
    
    private func channelInfo(for channel: Channel) -> NSAttributedString {
        
        let resultAttrString = NSMutableAttributedString()
        
        let descriptionAttributes = [
            NSAttributedString.Key.font: Style.regularBaseLabelFont
        ]
        
        let videoStatisticsAttributes = [
            NSAttributedString.Key.font: Style.regularBaseLabelFont
        ]
        
        
        let descriptionAttrString = NSAttributedString(string: channel.description,
                                                       attributes: descriptionAttributes)
        
        let videoCountAttrString = NSAttributedString(string: "Videos: \(channel.videoCount!)",
                                                      attributes: videoStatisticsAttributes)
        
        let viewCountAttrString = NSAttributedString(string: "Views: \(channel.viewCount!)",
                                                     attributes: videoStatisticsAttributes)
        
        var averageViewCount = 0
        if channel.viewCount != nil && channel.videoCount != nil {
            averageViewCount = channel.viewCount!/channel.videoCount!
        } else {
            averageViewCount = 0
        }
        
        let averageViewCountAttrString = NSAttributedString(string: "Average views on video: \(averageViewCount)",
                                                            attributes: videoStatisticsAttributes)
        
        let subscriberCountAttrString = NSAttributedString(string: "Subscribers: \(channel.subscriberCount!)",
                                                           attributes: videoStatisticsAttributes)
        
        
        var dateRepresentation: String = ""
        if let date = dateFormatterToGetData.date(from: channel.publishedAt) {
            dateRepresentation = dateFormatterToGetString.string(from: date)
        }
        
        let createdOnAttrString = NSAttributedString(string: "Created on: \(dateRepresentation)",
                                                             attributes: videoStatisticsAttributes)
        
        resultAttrString.append(descriptionAttrString)
        resultAttrString.append(NSAttributedString(string: "\n\n"))
        resultAttrString.append(videoCountAttrString)
        resultAttrString.append(NSAttributedString(string: "\n\n"))
        resultAttrString.append(viewCountAttrString)
        resultAttrString.append(NSAttributedString(string: "\n\n"))
        resultAttrString.append(averageViewCountAttrString)
        resultAttrString.append(NSAttributedString(string: "\n\n"))
        resultAttrString.append(subscriberCountAttrString)
        resultAttrString.append(NSAttributedString(string: "\n\n"))
        resultAttrString.append(createdOnAttrString)
        resultAttrString.append(NSAttributedString(string: "\n"))

        return resultAttrString
    }
}
