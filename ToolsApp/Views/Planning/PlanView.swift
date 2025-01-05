//
//  PlanView.swift
//  ToolsApp
//
//  Created by Роман on 04.01.2025.
//

import SwiftUI

struct PlanView: View {
    @StateObject var vm: PlainingViewModel
    @State private var presentDeleteAlert: Bool = false
    var body: some View {
        VStack{
            HStack{
                //MARK: - Clouse button
                Button(action: {vm.presentPlanView()}) {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                Spacer()
                //MARK: - Name tool
                if let plan = vm.simplePlan{
                    Text(plan.name ?? "")
                        .font(.system(size: 22))
                }
                Spacer()
                
                //MARK: - Option button
                Menu("...") {
                    Button {
                        vm.tapEditButton()
                    } label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    Button {} label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(role: .destructive, action: {
                        presentDeleteAlert = true
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .padding(.vertical)
            
            Divider()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20){
                    //MARK: - Power tools
                    if let powers = vm.simplePlan?.power?.allObjects as? [PowerTool] {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Necessary power tools")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            VStack{
                                ForEach(powers) { power in
                                    HStack{
                                        Button {
                                            vm.completePowerTools(power: power)
                                        } label: {
                                            Image(systemName: power.complet ? "checkmark.square" : "square")
                                                .foregroundStyle(.black)
                                        }
                                        Text(power.name ?? "")
                                            .font(.system(size: 16))
                                        Spacer()
                                    }

                                }
                            }
                            
                        }
                    }
                    
                    //MARK: - Hand tools
                    if let hands = vm.simplePlan?.hand?.allObjects as? [HandTool] {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Necessary hand tools")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            VStack{
                                ForEach(hands) { hand in
                                    HStack{
                                        Button {
                                            vm.completeHandTools(handTool: hand)
                                        } label: {
                                            Image(systemName: hand.complet ? "checkmark.square" : "square")
                                                .foregroundStyle(.black)
                                        }
                                        Text(hand.name ?? "")
                                            .font(.system(size: 16))
                                        Spacer()
                                    }

                                }
                            }
                            
                        }
                    }
                    
                    //MARK: - Workers
                    if let workers = vm.simplePlan?.worker?.allObjects as? [Worker] {
                        VStack(alignment: .leading, spacing: 10) {
                            
                            Text("Workers")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            VStack{
                                ForEach(workers) { worker in
                                    HStack{
                                        Button {
                                            vm.completeWorkers(worker: worker)
                                        } label: {
                                            Image(systemName: worker.complet ? "checkmark.square" : "square")
                                                .foregroundStyle(.black)
                                        }
                                        Text(worker.name ?? "")
                                            .font(.system(size: 16))
                                        Spacer()
                                    }

                                }
                            }
                            
                        }
                    }
                }
            }
        }
        .padding()
        .alert("Delete plan?", isPresented: $presentDeleteAlert) {
                        Button("Cancel", role: .cancel) {
                            presentDeleteAlert = false
                        }
                        Button("Delete", role: .destructive) {
                            vm.deletePlan()
                        }
                    } message: {
                        Text("Are you sure you want to delete this plan? This action cannot be undone.")
                    }
        
    }
}

#Preview {
    PlanView(vm: PlainingViewModel())
}
