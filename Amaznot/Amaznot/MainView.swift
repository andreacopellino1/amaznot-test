//
//  MainView.swift
//  Amaznot
//
//  Created by Andrea Copellino on 18/11/22.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            PlaceholderView()
                .tabItem {
                    Label("Shop", systemImage: "house")
                }
            PlaceholderView()
                .tabItem {
                    Label("Categories", systemImage: "square.grid.3x2")
                }
            ProductView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            PlaceholderView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
        }
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
        .environmentObject(DataStore())
    }
}
