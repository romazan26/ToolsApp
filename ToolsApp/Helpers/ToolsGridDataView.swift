//
//  ToolsGridDataView.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct ToolsGridDataView: View {
    
    var condition: String
    var manufacturer: String
    var toolTipe: String
    var price: String
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Tool Condition")
                        .font(.system(size: 12))
                    Text(condition)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    Color.grayApp.cornerRadius(20)
                }
                VStack(alignment: .leading) {
                    Text("Tool Type")
                        .font(.system(size: 12))
                    Text(toolTipe)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    Color.grayApp.cornerRadius(20)
                }
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("Manufacturer")
                        .font(.system(size: 12))
                    Text(manufacturer)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    Color.grayApp.cornerRadius(20)
                }
                VStack(alignment: .leading) {
                    Text("Price")
                        .font(.system(size: 12))
                    Text("$" + price)
                        .font(.system(size: 16))
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    Color.grayApp.cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    ToolsGridDataView(condition: "New", manufacturer: "ToolMaster", toolTipe: "HandTools", price: "10.95")
}
