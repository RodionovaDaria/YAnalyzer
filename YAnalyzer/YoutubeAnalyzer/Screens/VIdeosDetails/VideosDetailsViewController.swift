//
//  VideosDetailsViewController.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 30.08.2021.
//

import UIKit

class VideosDetailsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var playlistId: String?
    private var dataFetcher: DataFetcher?
    private var customNumberOfVideos: Int?
    private var videos = [Videos]()
    private var videosStatistics: [VideoStatistics] = []
    
    @IBOutlet private weak var backBatton: UINavigationItem!
    
    @IBOutlet private weak var tableView: UITableView!
    
    func configureVideosVC(playlistId: String, dataFetcher: DataFetcher, customNumberOfVideos: Int) {
        
        self.playlistId = playlistId
        self.dataFetcher = dataFetcher
        self.customNumberOfVideos = customNumberOfVideos
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videosStatistics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as!
            VideosTableViewCell
        
        let videoStatistics = self.videosStatistics[indexPath.row]
        cell.configureCell(videoStatistics)
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        fetchData()
    }
    
    private func setupView() {
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem?.setTitleTextAttributes([NSAttributedString.Key.font: Style.regularBaseLabelFont], for: .normal)
        
        title = "Video Statistics"
        view.backgroundColor = .systemBackground
        
        tableView.register(UINib(nibName: "VideosTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "VideosTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func fetchData() {
        
        guard let dataFetcher = dataFetcher,
              let playlistId = playlistId else {
            return
        }
        
        dataFetcher.getPlaylistItemsInfo(for: playlistId, numberOfVideos: customNumberOfVideos ?? 50, completion: { (channels) in
            
            var videosId: [String] = []
            
            for cha in channels {
                videosId.append(cha.videoId)
            }
            
            dataFetcher.getVideosInfo(for: videosId) { (videos) in
                
                self.videos = videos
                
                let calculator = StatisticsCalculator()
                
                self.videosStatistics = calculator.getVideosStatistics(videos: videos)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
}
