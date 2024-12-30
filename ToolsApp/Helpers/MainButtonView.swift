//
//  MainButtonView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct MainButtonView: View {
    var text: String = ""
    var body: some View {
        ZStack {
            Color.accent
                .frame(height: 36)
                .cornerRadius(100)
            Text(text)
                .foregroundStyle(.white)
        }
            
    }
}

#Preview {
    MainButtonView(text: "Next view")
}
