//
//  MainButtonView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct MainButtonView: View {
    var text: String = ""
    var isactive: Bool = true
    var body: some View {
        ZStack {
            Color(isactive ? .accent : .grayApp)
                .frame(height: 36)
                .cornerRadius(100)
            Text(text)
                .foregroundStyle(isactive ? .white : .gray)
        }
            
    }
}

#Preview {
    MainButtonView(text: "Next view")
}
