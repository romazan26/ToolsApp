//
//  SettingButton.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//
import Foundation
import SwiftUI

struct SettingButton: View {
    var text = ""
    var imageName = ""
    var body: some View {
        ZStack {
            Color(.grayApp)
                .cornerRadius(100)
                
            HStack {
                
                Text(text)
                    .foregroundStyle(.black)
                    .font(.system(size: 16))
                    
                
                Image(systemName: imageName)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.black)
                
               
            }
            .padding()
        }
        .frame(height: 36)
    }
}

#Preview {
    SettingButton(text: "dasdas", imageName: "star")
}
