//
//  RoundedButton.swift
//  YoutubeAnalyzer
//
//  Created by Dasha on 02.05.2022.
//

import UIKit

class RoundedButton: UIButton {
    
    enum ButtonStyle {
        case regular
        case inversed
    }
    
    var buttonStyle: ButtonStyle = .regular {
        didSet {
            applyStyle()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        commonInit()
    }
    
    private func commonInit() {
        
        titleLabel?.font = Style.regularButtonFont
        layer.cornerRadius = Style.buttonCornerRadius
        applyStyle()
    }
    
    private func applyStyle() {
        switch self.buttonStyle {
        case .regular:
            backgroundColor = Style.primaryColor
            titleLabel?.textColor = UIColor.clear
            layer.borderWidth = 0
        case .inversed:
            backgroundColor = UIColor.clear
            titleLabel?.textColor = Style.primaryColor
            layer.borderWidth = Style.buttonBorderWidth
            layer.borderColor = Style.primaryColor.cgColor
        }
    }
}
