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
    var delete = false
    var body: some View {
        ZStack(alignment: .topTrailing) {
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
            .padding(8)
            .background {
                Color(isActive ? .main : .grayApp)
                    .cornerRadius(100)
            }
            if delete{
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .offset(x: 5, y: -5)
                    .foregroundStyle(.main)
            }
        }
    }
}
#Preview {
    TagButtonView(text: "Tags", image: "", isActive: false, delete: true)
}
