//
//  InvertedButton.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation
import UIKit

final class InvertedButton: UIButton, CustomButton {
    let buttonConfig: ButtonConfig = .invertedButton
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    private func configure(){
        self.layer.cornerRadius = buttonConfig.cornerRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = buttonConfig.borderColor
        self.setTitleColor(buttonConfig.titleColor, for: .normal)
        self.heightAnchor.constraint(equalToConstant: buttonConfig.height).isActive = true
    }
    
}
