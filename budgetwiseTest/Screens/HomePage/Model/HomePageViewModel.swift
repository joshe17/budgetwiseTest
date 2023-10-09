//
//  HomePageViewModel.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/7/23.
//

import Foundation

class HomePageViewModel: ObservableObject {
    @Published var categories: [Category] = [Category(categoryName: "X", moneySpent: 0, totalBudget: 0, icon: "x.circle", color: "categoryBlue")]

    init() {
        self.updateUserDefaults();
    }
    
    func calculateSpendingProgressWidth(_ moneySpent: Int,_ totalBudget: Int) -> Float {
        return Float(moneySpent) / Float(totalBudget)
    }
    
    func calculateTotalSpent() -> Int {
        return self.categories.reduce(0, {$0 + $1.moneySpent})
    }
    
    func calculateTotalBudget() -> Int {
        return self.categories.reduce(0, {$0 + $1.totalBudget})
    }
    
    func addAmountToCategory(amt: Int, categoryName: String) -> Bool{
        for i in 0..<self.categories.count {
            if categoryName == self.categories[i].categoryName {
                self.categories[i].moneySpent += amt
                self.saveAllCategories(allCategories: self.categories)
                return true
            }
        }
        print("No category with that name found, add one first.")
        return false
    }

    private func updateUserDefaults() {
        let defaultCategories = [
            Category(categoryName: "Food", moneySpent: 10, totalBudget: 100, icon: "fork.knife", color: "categoryBlue"),
            Category(categoryName: "Shopping", moneySpent: 20, totalBudget: 100, icon: "cart", color: "categoryLightBlue"),
            Category(categoryName: "Transportation", moneySpent: 20, totalBudget: 100, icon: "car", color: "categoryYellow"),
            Category(categoryName: "Education", moneySpent: 40, totalBudget: 100, icon: "graduationcap", color: "categoryTeal")
        ]
        if let objects = UserDefaults.standard.value(forKey: "user_categories") as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Category] {
                self.categories = objectsDecoded
            } else {
                self.categories = defaultCategories
            }
        } else {
            self.categories = defaultCategories
        }
        
    }

    private func saveAllCategories(allCategories: [Category]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allCategories){
            UserDefaults.standard.set(encoded, forKey: "user_categories")
        }
    }
}

