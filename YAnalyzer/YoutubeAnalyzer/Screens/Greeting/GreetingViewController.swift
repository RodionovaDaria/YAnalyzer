//
//  GreetingViewController.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 14.02.2022.
//

import UIKit

class GreetingViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var greetingsLabel: UILabel!
    
    @IBOutlet weak var continueButton: RoundedButton!
    
    @IBAction func continueButtonTapped(_ sender: Any) {

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let appearingViewController = storyBoard.instantiateViewController(identifier: "startVC") as? StartingViewController else {
                return
            }
            
        self.navigationController?.pushViewController(appearingViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        
        view.backgroundColor = .systemBackground
        welcomeLabel.font = Style.headlineFont
        greetingsLabel.font = Style.mediumBaseLabelFont
        
        welcomeLabel.text = "Welcome to the YAnalyzer!"
        greetingsLabel.text = "You can view any youtube channel's original country, subscriber count, comments ratio and detailed statistics for each video. Just enter the link to a youtube channel."
    }
}
