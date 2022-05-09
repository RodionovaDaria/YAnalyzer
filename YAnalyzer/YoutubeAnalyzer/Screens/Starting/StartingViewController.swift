//
//  StartViewController.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 13.08.2021.
//

import UIKit

class StartingViewController: UIViewController {
    
    private var channelId: String?
    private var dataFetcher: DataFetcher?
    
    @IBOutlet weak var searchingDescription: UILabel!
    
    @IBOutlet weak var searchingField: UITextField!
    
    @IBOutlet weak var showChannel: RoundedButton!
    
    @IBOutlet weak var showPlaylist: RoundedButton!
    
    @IBAction func showPlaylistTapped(_ sender: Any) {
        
        searchingField.resignFirstResponder()
        
        
        guard let userInput = searchingField.text,
              !userInput.isEmpty else {
            showAlert(title: "Empty link!", errorMessage: "You should enter link to a playlist!")
            return
        }
        
        guard let playlistId = getPlaylistId(fromURL: userInput) else {
            showAlert(title: "Invalid link!", errorMessage: "The link you've entered is invalid, the link should be like the following: https://www.youtube.com/playlist?list=PLIydgJqqa2gu6-Wpd4zjILBg9d_WVMRIK")
            return
        }
        
        searchingField.text?.removeAll()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let appearingViewController = storyBoard.instantiateViewController(identifier: "videosVC") as? VideosDetailsViewController else {
            return
        }
        
        guard let dataFetcher = dataFetcher else {
            return
        }
        
        appearingViewController.configureVideosVC(playlistId: playlistId, dataFetcher: dataFetcher, customNumberOfVideos: 50)
        
        self.navigationController?.pushViewController(appearingViewController, animated: true)
    
    }
    
    @IBAction func showChannelTapped(_ sender: UIButton!) {
        
        guard let dataFetcher = dataFetcher else {
            return
        }
        
        searchingField.resignFirstResponder()
        
        guard let userInput = searchingField.text,
              !userInput.isEmpty else {
            showAlert(title: "Empty link!", errorMessage: "You should enter link to a channel!")
            return
        }
        
        guard let channelId = getChannelId(fromURL: userInput) else {
            showAlert(title: "Invalid link!", errorMessage: "The link you've entered is invalid, the link should be like the following: https://www.youtube.com/channel/UC0M0rxSz3IF0CsSour1iWmw")
            return
        }
        
        searchingField.text?.removeAll()
        
        dataFetcher.getChannelInfo(for: channelId, completion: { (channels, error) in
            
            guard error == nil else {
                
                DispatchQueue.main.async {
                    self.showAlert(title: "Error!", errorMessage: "Channel's link is invalid")
                }
                return
            }
            guard channels.count > 0 else {
                return
            }
            let channel = channels[0]
            
            DispatchQueue.main.async {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                guard let appearingViewController = storyBoard.instantiateViewController(identifier: "channelVC") as? ChannelInfoViewController else {
                    return
                }
                appearingViewController.configureChannelVC(dataFetcher: dataFetcher, channel: channel)
                
                self.navigationController?.pushViewController(appearingViewController, animated: true)
            }

        })
    }
    
    private func getPlaylistId(fromURL urlString: String) -> String? {
        
        guard urlString.contains("youtube.com/playlist?list="),
              let slashIndex = urlString.lastIndex(of: "=") else {
            return nil
        }
        
        var stringWithSlash = urlString[slashIndex...]
        stringWithSlash.removeFirst()
        let channelId = String(stringWithSlash)
        
        if channelId.isEmpty {
            return nil
        }
        
        return channelId
    }
    
    private func getChannelId(fromURL urlString: String) -> String? {
        
        guard urlString.contains("youtube.com/channel/"),
              let slashIndex = urlString.lastIndex(of: "/") else {
            return nil
        }
        
        var stringWithSlash = urlString[slashIndex...]
        stringWithSlash.removeFirst()
        let channelId = String(stringWithSlash)
        
        if channelId.isEmpty {
            return nil
        }
        
        return channelId
    }
    
    func showAlert(title: String, errorMessage: String) {

        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        
        self.present(alert, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        dataFetcher = DataFetcher()
    }
    
    private func setupView() {
        
        setupNavigationController()
        
        title = "YAnalyzer"
        searchingDescription.text = "Insert the link to a youtube channel, or a youtube playlist. \nLink may be the following: \nhttps://www.youtube.com/channel/UC-lHJZR3Gqxm24_Vd_AJ5Yw."
        
        searchingDescription.font = Style.mediumBaseLabelFont
        showPlaylist.buttonStyle = .inversed
    }
    
    private func setupNavigationController() {
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: Style.navigationBarLargeTitleText,NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: Style.navigationBartitleTextAttributes,NSAttributedString.Key.foregroundColor: UIColor.systemOrange]
   
        self.navigationItem.hidesBackButton = true
    }
}
