//
//  ConditionCellView.swift
//  ToolsApp
//
//  Created by Роман on 01.01.2025.
//

import SwiftUI

struct ConditionCellView: View {
    var title: String
    var isAcctive: Bool = false
    var body: some View {
        Text(title)
            .padding(.horizontal)
            .font(.system(size: 12))
            .foregroundStyle(isAcctive ? .white : .black)
            .padding(8)
            .background {
                Color(isAcctive ? .main : .grayApp)
                    .cornerRadius(50)
            }
    }
}

#Preview {
    ConditionCellView(title: "New")
}
