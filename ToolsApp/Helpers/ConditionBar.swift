//
//  ConditionBar.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct ConditionBar: View {
    var condition = ""
    var body: some View {
        VStack {
            HStack {
                Text("Tool Condition")
                    .foregroundStyle(.black)
                    .font(.system(size: 12))
                Spacer()
            }
            Text(condition)
                .foregroundStyle(.black)
                .font(.system(size: 22,weight: .bold))
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.grayApp)
                        .frame(height: 8)
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.yellowApp)
                        .frame(height: 8)
                        .frame(width: (geometry.size.width / 100) * getProgress())
                }
                HStack{
                    Text("Broken")
                    Spacer()
                    Text("New")
                }.padding(.top)
            }
        }
        .frame(height: 100)
        .padding()
        .background {
            Color.yellowApp
                .opacity(0.3)
                .cornerRadius(20)
        }
    }
    func getProgress() -> Double {
        switch condition {
        case "New": return 100
        case "In Use" : return 75
        case  "Functional" : return 50
        case "Needs Maintenance" : return 25
        default:
            return 0
        }
    }
}

#Preview {
    ConditionBar(condition: "In Use")
}
