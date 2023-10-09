//
//  AddTransactionView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/7/23.
//

import SwiftUI

struct AddTransactionView: View {
    @ObservedObject var viewModel: HomePageViewModel
    @State var categoryText = ""
    @State var amountNo = 0
    @State var categoryExists = true
    @Binding var showView: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Category: ")
                    .foregroundColor(.white).bold()
                Spacer()
                TextField("Food, Shopping..", text: $categoryText)
                    .padding()
                    .background(Color(.systemGray6)) //Color.systemGray6
                    .cornerRadius(15)
                    .padding(.horizontal, 16)
            }
            .padding()
            HStack {
                Text("Amount: ")
                    .foregroundColor(.white).bold()
                Spacer()
                TextField("Enter a number", value: $amountNo, format: .number)
                    .padding()
                    .background(Color(.systemGray6)) //Color.systemGray6
                    .cornerRadius(15)
                    .padding(.horizontal, 16)
            }
            .padding()
            
            if categoryExists {
                Button {
                    if !viewModel.addAmountToCategory(amt: amountNo, categoryName: categoryText) {
                        categoryExists.toggle()
                    } else {
                        showView.toggle()
                    }
                } label: {
                    VStack(alignment: .trailing) {
                        Text("Submit")
                            .foregroundColor(.white).bold()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                    .background(Color("greenText"))
                }
            } else {
                HStack {
                    Text("Error - No category with that name found")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.red)
                    Button {
                        categoryExists.toggle()
                    } label: {
                        Image(systemName: "arrow.uturn.left")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 20, maxHeight: 20)
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            
        }
        .background(Color("buttonAccents"))
        .cornerRadius(15)
        .padding()
    }
}


//
//struct AddTransactionView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTransactionView(viewModel: HomePageViewModel())
//    }
//}
