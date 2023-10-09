//
//  HomePageView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/7/23.
//

import SwiftUI

struct HomePageView: View {
    @StateObject var viewModel: HomePageViewModel = HomePageViewModel()
    @State var showAddTransactionView = false
    
    var body: some View {
        ZStack {
            ScrollView{
                ZStack {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color("buttonAccents"))
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.33)
                            .position(x: geometry.size.width/2, y: 0)
                            .edgesIgnoringSafeArea(.all)
                    }
                    VStack {
                        HStack {
                            Text("Monthly Budget")
                                .font(.system(size: 18)).bold()
                                .foregroundColor(.white)
                            Image(systemName: "chevron.down")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.leading, .top], 30)

                        VStack {
                            BudgetHeaderView(viewModel: viewModel)
                            BudgetSpendingBarView(viewModel: viewModel)
                            ForEach(viewModel.categories) { category in
                                BudgetListView(category: category)
                            }
                        }
                        .background(.white)
                        .cornerRadius(16)
                        .shadow(radius: 3)
                        .padding([.horizontal, .bottom])
                    }
                }
            }
            .background(Color("background"))
            .overlay {
                Button {
                    // Action
                    showAddTransactionView.toggle()
                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color("buttonAccents"))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
            }
            
            if showAddTransactionView {
                ZStack {
                    Color.black
                        .opacity(0.7)
                        .edgesIgnoringSafeArea(.all)
                    AddTransactionView(viewModel: viewModel, showView: $showAddTransactionView)

                }
            }
        }
    }
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
