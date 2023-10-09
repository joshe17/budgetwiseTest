//
//  ContentView.swift
//  budgetwiseTest
//
//  Created by Joshua Ho on 10/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Trends")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Trends")
                }
            Text("Transactions")
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Transactions")
                }
            Text("Community")
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right")
                    Text("Community")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
