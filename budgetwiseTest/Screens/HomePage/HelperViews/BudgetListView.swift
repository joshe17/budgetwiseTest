//
//  BudgetListView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/8/23.
//

import SwiftUI

struct BudgetListView: View {
    var category: Category
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 41, height: 41)
                        .foregroundColor(Color(category.color))
                    Image(systemName: category.icon)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 24, maxHeight: 24)
                        .foregroundColor(.white)
                }
                .padding(.leading)
                
                
                VStack(alignment: .leading) {
                    Text(category.categoryName)
                        .font(.system(size: 16)).bold()
                    Text("spent ").font(.system(size: 15)).foregroundColor(Color("grayText")).bold() + Text("$\(category.moneySpent)").font(.system(size: 15)).foregroundColor(Color("greenText")).bold() + Text(" of ").font(.system(size: 15)).foregroundColor(Color("grayText")).bold() + Text("$\(category.totalBudget)").font(.system(size: 15)).foregroundColor(Color("greenText")).bold()
                }
                
                Spacer()
                
                VStack {
                    Text("$\(category.totalBudget - category.moneySpent)")
                        .font(.system(size: 21)).bold()
                        .foregroundColor(category.moneySpent <= category.totalBudget ? Color("greenText") : Color(.red))
                    Text("left")
                        .font(.system(size: 13))
                }
                .padding(.trailing)
                
            }
            
            ProgressView(value: Float(category.moneySpent), total: Float(category.totalBudget))
                .progressViewStyle(BarProgressStyle(color: category.color, height: 8.0))
            
        }
        .padding(.vertical)
        
    }
}


struct BarProgressStyle: ProgressViewStyle {
 
    var color: String
    var height: Double
 
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Rectangle()
                    .fill(Color("rectangleGray"))
                    .frame(height: height)
                    .frame(width: geometry.size.width)
                    .overlay(alignment: .leading) {
                        Rectangle()
                            .fill(Color(color))
                            .frame(width: geometry.size.width * progress)
                    }
            }
        }
    }
}

//struct BudgetListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BudgetListView()
//    }
//}
