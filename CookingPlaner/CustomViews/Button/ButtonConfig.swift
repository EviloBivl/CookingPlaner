//
//  ButtonConfig.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation
import UIKit

protocol CustomButton {
    var buttonConfig: ButtonConfig { get }
}

enum ButtonConfig {

    case filledButton
    case invertedButton
    
    
    var cornerRadius: CGFloat {
        switch self {
        case .filledButton, .invertedButton: return 4
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .filledButton:
            return ColorName.buttonColor.color
        case .invertedButton:
            return .white
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .invertedButton:
            return ColorName.buttonColor.color.cgColor
        case .filledButton:
            return UIColor.white.cgColor
        }
    }
    
    var titleColor: UIColor {
        switch self {
        case .invertedButton:
            return ColorName.buttonColor.color
        case .filledButton:
            return .white
        }
    }
    
    var height: CGFloat {
        switch self {
        case .filledButton, .invertedButton: return 40
        }
    }
    
}
