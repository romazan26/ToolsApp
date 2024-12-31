//
//  RootView.swift
//  ToolsApp
//
//  Created by Роман on 30.12.2024.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            ToolsView()
                .tabItem {
                    VStack{
                        Image(systemName: "hammer.fill")
                        Text("Tools")
                    }
                }
            PlanningView()
                .tabItem {
                    VStack{
                        Image(systemName: "checklist")
                        Text("Planning")
                    }
                }
            WishlistView()
                .tabItem {
                    VStack{
                        Image(systemName: "pencil.and.list.clipboard")
                        Text("Planning")
                    }
                }
            SettingsView()
                .tabItem {
                    VStack{
                        Image(systemName: "gearshape.fill")
                        Text("Planning")
                    }
                }
        }
    }
}

#Preview {
    RootView()
}
