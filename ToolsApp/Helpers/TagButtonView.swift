//
//  TagButtonView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import Foundation
import SwiftUI

struct TagButtonView: View {
    var text: String
    var image: String = ""
    var isActive: Bool = true
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(isActive ? .white : .black)
                .padding(.horizontal)
            if image != "" {
                Image(systemName: image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(isActive ? .white : .black)
            } 
        }
        .padding()
        .background {
            Color(isActive ? .accent : .grayApp)
                .cornerRadius(100)
        }
    }
}
#Preview {
    TagButtonView(text: "Tags", image: "")
}
