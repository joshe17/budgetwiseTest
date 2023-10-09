//
//  HomePageData.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/7/23.
//

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    let categoryName: String
    var moneySpent: Int
    var totalBudget: Int
    let icon: String
    let color: String
}

