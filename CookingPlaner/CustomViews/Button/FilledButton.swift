//
//  File.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation
import UIKit

final class FilledButton: UIButton, CustomButton {
    let buttonConfig: ButtonConfig = .filledButton
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure(){
        self.layer.cornerRadius = buttonConfig.cornerRadius
        self.backgroundColor = buttonConfig.backgroundColor
        self.setTitleColor(buttonConfig.titleColor, for: .normal)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: buttonConfig.height).isActive = true
    }
    
}
