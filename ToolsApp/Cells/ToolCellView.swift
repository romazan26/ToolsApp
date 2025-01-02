//
//  ToolCellView.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct ToolCellView: View {
    @ObservedObject var tool: Tool
    @StateObject var vm: ToolsViewModel
    var body: some View {
        VStack {
            HStack {
                Text(tool.name ?? "")
                    .font(.system(size: 22))
                    .foregroundStyle(.black)
                Spacer()
                vm.getCard(card: tool.card ?? "").image
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
            }
            HStack{
                Text(tool.condition ?? "")
                    .foregroundStyle(.white)
                    .padding(8)
                    .background {
                        Color.main
                            .cornerRadius(50)
                    }
                Text(tool.type ?? "")
                    .foregroundStyle(.white)
                    .padding(8)
                    .background {
                        Color.main
                            .cornerRadius(50)
                    }
                Spacer()
            }
            HStack{
                Text("$\(String(format: "%.2f", tool.price))")
                    .foregroundStyle(.black)
                Spacer()
                    
            }
            
        }
        .frame(height: 120)
        .padding(10)
        .background {
            Color.grayApp.cornerRadius(20)
        }
    }
}

#Preview {
    ToolCellView(tool: Tool(), vm: ToolsViewModel())
}
