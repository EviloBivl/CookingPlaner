//
//  OnboardingWelcomeScreenViewController.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation
import UIKit

final class OnboardingWelcomeScreenViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonAction(_ sender: Any) {
        self.navigationController?.pushViewController(OnboardingAddMealViewController.create(), animated: true)
    }
    
    class func create() -> OnboardingWelcomeScreenViewController {
        return StoryboardScene.OnboardingWelcomeScreen.onboardingWelcomeScreenViewController.instantiate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        
    }
    
}
