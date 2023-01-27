//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Ami Smith on 10/18/22.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        
        let firstBreakfastFood = Food(name: "Scrambled Eggs", description: "Yummy, healthy eggs! A good source of protein. They go great with a piece of toast!")
        let secondBreakfastFood = Food(name: "Toast", description: "Crunchy, buttery bread.")
        let breakfast = Meal(name: "Breakfast", food: [firstBreakfastFood, secondBreakfastFood])
        
        
        let firstLunchFood = Food(name: "Salad", description: "A nice assortment of rabbit food, displayed artfully in a bowl and best served with a hint of dressing.")
        let lunch = Meal(name: "Lunch", food: [firstLunchFood])
        
        let firstDinnerFood = Food(name: "Pizza", description: "America's favorite food")
        let dinner = Meal(name: "Dinner", food: [firstDinnerFood])
        
        return [breakfast, lunch, dinner]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = meals[section]
        let food = meal.food
        
        return food.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]

        
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        
        return meal.name
    }
}
