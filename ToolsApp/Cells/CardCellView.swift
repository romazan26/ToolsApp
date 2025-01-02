//
//  CardCellView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct CardCellView: View {
    var image: Image
    var isActive: Bool = false
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(isActive ? .pinkApp : .grayApp)
            image
                .resizable()
                .frame(width: 32, height: 32)
                .padding()
                .foregroundStyle(isActive ? .main : .black)
        }.frame(width: 48, height: 48)
    }
}

#Preview {
    CardCellView(image: Image(systemName: "screwdriver.fill"))
}
