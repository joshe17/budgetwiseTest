//
//  BudgetSpendingBarView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/8/23.
//

import SwiftUI
import Charts

struct BudgetSpendingBarView: View {
    @ObservedObject var viewModel: HomePageViewModel
    var body: some View {
        Rectangle()
            .frame(height: 32)
            .foregroundColor(Color("rectangleGray"))
            .cornerRadius(10)
            .overlay {
                GeometryReader { geometry in
                    Chart{
                        ForEach(viewModel.categories) { category in
                            BarMark(
                                x: .value("Amount Spent", category.moneySpent),
                                stacking: .center)
                            .foregroundStyle(Color(category.color))
                            .cornerRadius(10)
                        }
                        
                    }
                    .frame(maxWidth: CGFloat(Float(geometry.size.width) * viewModel.calculateSpendingProgressWidth(viewModel.calculateTotalSpent(), viewModel.calculateTotalBudget())), maxHeight: 32)
                    .chartXAxis(.hidden)
                    .chartYAxis(.hidden)
                }
            }
            .padding()
    }
}

struct SpendingBarProgressStyle: ProgressViewStyle {
 
    var color: String
    var height: Double = 32.0
    
    func makeBody(configuration: Configuration) -> some View {
        let progress = configuration.fractionCompleted ?? 0.0
        GeometryReader { geometry in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(color))
                .frame(height: height)
                .frame(width: geometry.size.width * progress)
        }
    }
}



//
//struct BudgetSpendingBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        BudgetSpendingBarView()
//    }
//}
