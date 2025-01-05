//
//  AddPlainingView.swift
//  ToolsApp
//
//  Created by Роман on 03.01.2025.
//

import SwiftUI

struct AddPlainingView: View {
    @StateObject var vm: PlainingViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack(spacing: 20){
                //MARK: - Top toolBar
                HStack{
                    Spacer()
                    Text("Add plan")
                        .font(.system(size: 22))
                        .foregroundStyle(.black)
                    Spacer()
                    Button {
                        vm.presentAddPlaining()
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
                            .focused($isFocused)
                    }
                    .padding(.top)
                    
                    Divider()
                    
                    //MARK: - Power tools
                    VStack(alignment: .leading) {
                        
                        Text("Necessary power tools")
                            .foregroundStyle(.black)
                            .font(.system(size: 12))
                        HStack{
                            TextField("Tool", text: $vm.simplePowerTool)
                                .textFieldStyle(.roundedBorder)
                                .focused($isFocused)
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
                                        .focused($isFocused)
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
                        HStack{
                            TextField("Tool", text: $vm.simpleHandTool)
                                .textFieldStyle(.roundedBorder)
                                .focused($isFocused)
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
                                        .focused($isFocused)
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
                        HStack{
                            TextField("Worker", text: $vm.simpleWorker)
                                .textFieldStyle(.roundedBorder)
                                .focused($isFocused)
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
                                        .focused($isFocused)
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
            .onTapGesture {
                isFocused = false
            }
            
            //MARK: - Save button
            Button {
                vm.addData()
                vm.presentAddPlaining()
            } label: {
                MainButtonView(text: "Save and add")
                    .opacity(vm.simplePlanName.isEmpty ? 0.5 : 1)
            }.disabled(vm.simplePlanName.isEmpty)

        }.padding()
    }
}

#Preview {
    AddPlainingView(vm: PlainingViewModel())
}
