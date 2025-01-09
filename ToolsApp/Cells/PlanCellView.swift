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
            HStack{
                VStack(alignment: .leading){
                Text(plan.name ?? "")
                    .font(.system(size: 22))
                    .foregroundStyle(.black)
                
                ConditionCellView(title: plan.type ?? "",isAcctive: true)
                
                if let powers = plan.power?.allObjects as? [PowerTool]{
                    HStack{
                        Text("Power tools: ")
                        Text("\(vm.getCompletedPowerTools(powerTools: powers))/\(powers.count)")
                    }
                    .foregroundStyle(.black)
                    .opacity(vm.getStatusPlan(plan: plan) ? 0.5 : 1)
                }
                
                if let hands = plan.hand?.allObjects as? [HandTool]{
                    HStack{
                        Text("Hand tools: ")
                        Text("\(vm.getCompletedHandTools(handTools: hands))/\(hands.count)")
                    }
                    .foregroundStyle(.black)
                    .opacity(vm.getStatusPlan(plan: plan) ? 0.5 : 1)
                }
                
                if let workers = plan.worker?.allObjects as? [Worker]{
                    HStack{
                        Text("Workers: ")
                        Text("\(vm.getCompletedWorkers(workers: workers))/\(workers.count)")
                    }
                    .foregroundStyle(.black)
                    .opacity(vm.getStatusPlan(plan: plan) ? 0.5 : 1)
                }
            }
                Spacer()
                //MARK: - New button
                VStack(spacing: 20){
                    
                    //MARK: Edit button
                    Button {
                        vm.tapEditButtonOnCell(plan: plan)
                    } label: {
                        Image(systemName: "pencil.line")
                            .foregroundStyle(.black)
                    }
                    
                    
                    //MARK: Delete button
                    Button {
                        vm.simplePlan = plan
                        vm.isPresentAlertDelete = true
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundStyle(.main)
                    }
                }
            }
            HStack{
                Spacer()
                Text(vm.getStatusPlan(plan: plan) ? "Done" : "In progress")
                    .foregroundStyle(vm.getStatusPlan(plan: plan) ? .white : .black)
                    .padding(8)
                    .background {
                        Color(vm.getStatusPlan(plan: plan) ? .green : .gray)
                            .cornerRadius(20)
                    }
            }
            
        }
        .padding()
        .background {
            Color(vm.getStatusPlan(plan: plan) ? .donePlan : .grayApp)
                .cornerRadius(20)
        }
    }
}

#Preview {
    PlanCellView(plan: Plan(), vm: PlainingViewModel())
}
