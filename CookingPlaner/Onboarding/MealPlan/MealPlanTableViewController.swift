//
//  MealPlanTableViewController.swift
//  CookingPlaner
//
//  Created by Paul Neuhold Privat on 26.09.20.
//

import Foundation
import UIKit

final class MealPlanTableViewController: UITableViewController {
    
    var meals = UserDefaults.standard.object(forKey: OnboardingAddMealViewController.userDefaultMealKey) as? [String] ?? [String]()
    let today = Calendar.current.component(.weekday, from: Date())
    
    class func create() -> MealPlanTableViewController {
        return StoryboardScene.MealPlanTableViewController.mealPlanTableViewController.instantiate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        meals.shuffle()
        self.tableView.backgroundColor = .systemGray5
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath)
        
        guard meals.indices.contains(indexPath.row) else { return UITableViewCell() }
        let meal = meals[indexPath.row]
        
        cell.textLabel?.text = meal
        cell.detailTextLabel?.text = "\(getWeekdayName(for: indexPath.row))"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Essensplan für die nächsten Tage"
    }
    
    private func getWeekdayName(for row: Int) -> String {
        switch (today + row) % 7 {
        case 0: return "Samstag"
        case 1: return "Sonntag"
        case 2: return "Montag"
        case 3: return "Dienstag"
        case 4: return "Mittwoch"
        case 5: return "Donnerstag"
        case 6: return "Freitag"
        
        default: return "Invalid Day"
        }
    }
    
}



