//
//  PlanCellView.swift
//  ToolsApp
//
//  Created by Роман on 03.01.2025.
//

import SwiftUI

struct PlanCellView: View {
    @ObservedObject var plan: Plan
    @StateObject var vm: PlainingViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text(plan.name ?? "")
                .font(.system(size: 22))
                .foregroundStyle(.black)
            
            ConditionCellView(title: plan.type ?? "")
            
            if let powers = plan.power?.allObjects as? [PowerTool]{
                HStack{
                    Text("Power tools: ")
                    Text("\(powers.count)")
                }
            }
            
            if let hands = plan.hand?.allObjects as? [HandTool]{
                HStack{
                    Text("Hand tools: ")
                    Text("\(hands.count)")
                }
            }
             
            if let workers = plan.worker?.allObjects as? [Worker]{
                HStack{
                    Text("Workers: ")
                    Text("\(workers.count)")
                }
            }
            HStack{
                Spacer()
                Text("In progress")
            }
            
        }.padding()
    }
}

#Preview {
    PlanCellView(plan: Plan(), vm: PlainingViewModel())
}
