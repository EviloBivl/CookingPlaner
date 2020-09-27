//
//  OnboardingAddMealViewController.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation

import Foundation
import UIKit

final class OnboardingAddMealViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var mealInputTextField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    static let userDefaultMealKey: String = "userDefaultMealKey"
    
    class func create() -> OnboardingAddMealViewController {
        return StoryboardScene.OnboardingAddMeal.onboardingAddMealViewController.instantiate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        addButton.addTarget(self, action: #selector(didPressAddButton), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(didPressDoneButton), for: .touchUpInside)
        addButton.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(didLongPressAddButton)))
        
        containerView.layer.cornerRadius = 15
        self.view.backgroundColor = .systemGray5
    }
    
    @objc private func didLongPressAddButton(){
        UserDefaults.standard.removeObject(forKey: OnboardingAddMealViewController.userDefaultMealKey)
    }
    
    @objc private func didPressAddButton(){
        guard let newMeal = mealInputTextField.text, !newMeal.isEmpty else { return }
        saveMeal(meal: newMeal)
        print("All Stored Meals: \(loadAllMeals())")
        mealInputTextField.text = ""
    }
    
    @objc private func didPressDoneButton(){
        self.navigationController?.pushViewController(MealPlanTableViewController.create(), animated: true)
    }
    
    
    private func saveMeal(meal: String ){
        var allMeals = loadAllMeals()
        guard !allMeals.contains(meal) else { return }
        allMeals.append(meal)
        UserDefaults.standard.setValue(allMeals, forKey: OnboardingAddMealViewController.userDefaultMealKey)
    }
    
    private func loadAllMeals() -> [String] {
        return UserDefaults.standard.object(forKey: OnboardingAddMealViewController.userDefaultMealKey) as? [String] ?? [String]()
    }
} 
