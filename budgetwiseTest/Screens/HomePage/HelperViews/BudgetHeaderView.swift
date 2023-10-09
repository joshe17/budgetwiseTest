//
//  BudgetHeaderView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/8/23.
//

import SwiftUI

struct BudgetHeaderView: View {
    @ObservedObject var viewModel: HomePageViewModel
    var body: some View {
        VStack {
            HStack {
                Text("April 2022")
                    .font(.system(size: 13)).bold()
                    .padding([.vertical, .leading], 4)
                Image(systemName: "arrowtriangle.down.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 10, maxHeight: 10)
                    .padding([.vertical, .trailing], 4)
            }
            .foregroundColor(Color("greenText"))
            .background(Color("greenHighlight"))
            .cornerRadius(5)
            .padding()

            
            HStack {
                VStack {
                    Text("Spent")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(Color("grayText"))
                    Text("$\(viewModel.calculateTotalSpent())")
                        .font(.system(size: 21)).bold()
                }
                .padding()
                Divider()
                    .frame(height: 32)
                VStack {
                    Text("Available")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(Color("greenText"))
                    Text("$\(viewModel.calculateTotalBudget() - viewModel.calculateTotalSpent())")
                        .font(.system(size: 26)).bold()
                        .foregroundColor(Color("greenText"))
                }
                .padding()
                Divider()
                    .frame(height: 32)
                VStack {
                    Text("Budget")
                        .bold()
                        .font(.system(size: 16))
                        .foregroundColor(Color("grayText"))
                    Text("$\(viewModel.calculateTotalBudget())")
                        .font(.system(size: 21)).bold()
                }
                .padding()
            }
        }
    }
}

//struct BudgetHeaderView_Previews: PreviewProvider {
//    static var previews: some View {
//        BudgetHeaderView()
//    }
//}
