//
//  EditPlanView.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import SwiftUI

struct EditPlanView: View {
        @StateObject var vm: PlainingViewModel
        var body: some View {
            ZStack(alignment: .bottom) {
                
                VStack(spacing: 20){
                    //MARK: - Top toolBar
                    HStack{
                        Spacer()
                        Text("Edit plan")
                            .font(.system(size: 22))
                            .foregroundStyle(.black)
                        Spacer()
                        Button {
                            vm.presentEditPlanView()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                        }
                        
                    }
                    ScrollView{
                        //MARK: - Plan type
                        VStack(alignment: .leading){
                            Text("Plan type")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                           
                            
                            ScrollView(.horizontal){
                                HStack{
                                    ForEach(PlanType.allCases , id: \.self) { type in
                                        Button {
                                            vm.simplePlanType = type
                                        } label: {
                                            ConditionCellView(title: type.title, isAcctive: vm.simplePlanType == type ? true : false)
                                        }
                                        
                                    }
                                }
                            }.scrollIndicators(.hidden)
                        }
                                                
                        //MARK: - Plan name
                        VStack(alignment: .leading) {
                            Text("Plan name")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            TextField("Enter plan name", text: $vm.simplePlanName)
                        }
                        .padding(.top)
                        
                        Divider()
                        
                        //MARK: - Power tools
                        VStack(alignment: .leading,spacing: 15) {
                            
                            Text("Necessary power tools")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            
                            if let powers = vm.simplePlan?.power?.allObjects as? [PowerTool] {
                                    VStack{
                                        ForEach(powers) { power in
                                            HStack{
                                                Text(power.name ?? "")
                                                    .font(.system(size: 16))
                                                
                                                Spacer()
                                                
                                                Button {
                                                    vm.completePowerTools(power: power)
                                                } label: {
                                                    Image(systemName: power.complet ? "checkmark.square" : "square")
                                                        .foregroundStyle(.black)
                                                }
                                                Button {
                                                    vm.deletePower(power: power)
                                                } label: {
                                                    Image(systemName: "xmark.circle")
                                                        .foregroundStyle(.red)
                                                }
                                            }

                                        }
                                    }
                                    
                                }
                            HStack{
                                TextField("Tool", text: $vm.simplePowerTool)
                                    .textFieldStyle(.roundedBorder)
                                Spacer()
                                //MARK: Add power tool button
                                Button {
                                    vm.addPowerTools()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .foregroundStyle(.gray)
                                }
                            }
                            if !vm.simplePowerTools.isEmpty{
                                ForEach(vm.simplePowerTools.indices, id: \.self) { index in
                                    HStack {
                                        TextField("", text: $vm.simplePowerTools[index])
                                            .textFieldStyle(.roundedBorder)
                                        Button {
                                            vm.deletePowerTools(index: index)
                                        } label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundStyle(.red)
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        //MARK: - Hand tools
                        VStack(alignment: .leading) {
                            
                            Text("Necessary hand tools")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            
                            if let hands = vm.simplePlan?.hand?.allObjects as? [HandTool] {
                                    VStack{
                                        ForEach(hands) { hand in
                                            HStack{
                                                Text(hand.name ?? "")
                                                    .font(.system(size: 16))
                                                
                                                Spacer()
                                                
                                                Button {
                                                    vm.completeHandTools(handTool: hand)
                                                } label: {
                                                    Image(systemName: hand.complet ? "checkmark.square" : "square")
                                                        .foregroundStyle(.black)
                                                }
                                                
                                                Button {
                                                    vm.deleteHand(hand: hand)
                                                } label: {
                                                    Image(systemName: "xmark.circle")
                                                        .foregroundStyle(.red)
                                                }
                                                
                                            }

                                        }
                                    }
                                    
                                
                            }
                            
                            HStack{
                                TextField("Tool", text: $vm.simpleHandTool)
                                    .textFieldStyle(.roundedBorder)
                                Spacer()
                                
                                //MARK: Add hand tool button
                                Button {
                                    vm.addHandTools()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .foregroundStyle(.gray)
                                }
                            }
                            if !vm.simpleHandTools.isEmpty{
                                ForEach(vm.simpleHandTools.indices, id: \.self) { index in
                                    HStack {
                                        TextField("", text: $vm.simpleHandTools[index])
                                            .textFieldStyle(.roundedBorder)
                                        Button {
                                            vm.deleteHandTools(index: index)
                                        } label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundStyle(.red)
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        //MARK: - Workers
                        VStack(alignment: .leading) {
                            
                            Text("Workers")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                            
                            if let workers = vm.simplePlan?.worker?.allObjects as? [Worker] {
                                VStack(alignment: .leading, spacing: 10) {

                                        ForEach(workers) { worker in
                                            HStack{
                                                Text(worker.name ?? "")
                                                    .font(.system(size: 16))
                                                Spacer()
                                                
                                                Button {
                                                    vm.completeWorkers(worker: worker)
                                                } label: {
                                                    Image(systemName: worker.complet ? "checkmark.square" : "square")
                                                        .foregroundStyle(.black)
                                                }
                                                Button {
                                                    vm.deleteWorkerForEdit(worker: worker)
                                                } label: {
                                                    Image(systemName: "xmark.circle")
                                                        .foregroundStyle(.red)
                                                }
                                                
                                               
                                            }

                                        }
                                    }
                                    
                                
                            }
                            HStack{
                                TextField("Worker", text: $vm.simpleWorker)
                                    .textFieldStyle(.roundedBorder)
                                Spacer()
                                
                                //MARK: Add worker button
                                Button {
                                    vm.addWorkers()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 36, height: 36)
                                        .foregroundStyle(.gray)
                                }
                            }
                            if !vm.simpleWorkers.isEmpty{
                                ForEach(vm.simpleWorkers.indices, id: \.self) { index in
                                    HStack {
                                        TextField("", text: $vm.simpleWorkers[index])
                                            .textFieldStyle(.roundedBorder)
                                        Button {
                                            vm.deleteWorkers(index: index)
                                        } label: {
                                            Image(systemName: "xmark.circle.fill")
                                                .foregroundStyle(.red)
                                        }
                                        
                                    }
                                }
                            }
                            
                        }
                        
                        Divider()
                        
                        
                        
                    }
                }
                
                //MARK: - Save button
                Button {
                    vm.saveEditPlan()
                } label: {
                    MainButtonView(text: "Save and add")
                        .opacity(vm.simplePlanName.isEmpty ? 0.5 : 1)
                }.disabled(vm.simplePlanName.isEmpty)

            }.padding()
    }
}

#Preview {
    EditPlanView(vm: PlainingViewModel())
}
