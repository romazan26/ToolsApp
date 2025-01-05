//
//  AddToolsView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct AddToolsView: View {
    @StateObject var vm: ToolsViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 15) {
                
                HStack {
                    Spacer()
                    Text(vm.isEditeMode ? "Edit tool" : "New tool")
                        .font(.system(size: 22))
                    Spacer()
                    Button {
                        vm.presentAddToolView()
                    } label: {
                        Image(systemName: "xmark")
                    }
                    
                }.foregroundStyle(.black)
                ScrollView {
                    VStack(spacing: 15) {
                        //MARK: - Card
                        VStack(alignment: .leading){
                            Text("Card icon")
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(Card.allCases, id: \.self) { card in
                                        Button {
                                            vm.simpleCard = card
                                        } label: {
                                            CardCellView(image: card.image, isActive: vm.cheakIsActiveCard(card: card))
                                        } .padding(9)
                                    }
                                }
                            }.scrollIndicators(.hidden)
                        }
                        
                        //MARK: - Tool condition
                        VStack(alignment: .leading){
                            Text("Tool Condition")
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(Condition.allCases, id: \.self) { condition in
                                        Button {
                                            vm.simpleToolCondition = condition
                                        } label: {
                                            ConditionCellView(title: condition.name, isAcctive: vm.cheakIsActiveCondition(condition: condition))
                                        }
                                    }
                                }
                            }.scrollIndicators(.hidden)
                        }
                        
                        //MARK: - Tool type
                        VStack(alignment: .leading){
                            Text("Tool Type")
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(TypeTools.allCases, id: \.self) { type in
                                        Button {
                                            vm.simpleType = type
                                        } label: {
                                            ConditionCellView(title: type.name, isAcctive: vm.cheatIsActiveType(type: type))
                                        }
                                    }
                                }
                            }.scrollIndicators(.hidden)
                        }
                        
                        //MARK: - Other type
                        TextField("Or write another type", text: $vm.simpleAnotherType)
                            .focused($isFocused)
                        
                        Divider()
                        
                        //MARK: - Tool name
                        VStack(alignment: .leading){
                            Text("Tool Name")
                            TextField("Write tool name", text: $vm.simpleToolName)
                                .focused($isFocused)
                        }
                        
                        Divider()
                        
                        //MARK: - Manafacturere
                        VStack(alignment: .leading){
                            Text("Manafacturer")
                            TextField("Enter manafacturer name", text: $vm.simpleToolManufactures)
                                .focused($isFocused)
                        }
                        
                        Divider()
                        
                        //MARK: - Price
                        VStack(alignment: .leading){
                            Text("Price")
                            TextField("Enter price", text: $vm.simpleToolPrice)
                                .focused($isFocused)
                        }
                        
                        Divider()
                        
                        //MARK: - Manual
                        VStack(alignment: .leading){
                            Text("Manual (optional)")
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $vm.simpleToolManual)
                                    .focused($isFocused)
                                if vm.simpleToolManual.isEmpty {
                                    Text("Write manual")
                                        .foregroundStyle(.gray)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 12)
                                }
                            }
                        }
                    }
                }
                Spacer()
                
            }
            .onTapGesture {
                isFocused = false
            }
            Button {
                if vm.isEditeMode{
                    vm.tapSaveEdite()
                }else{
                    vm.addData()
                    vm.presentAddToolView()
                }
            } label: {
                MainButtonView(text: vm.isEditeMode ? "Save and close" : "Save and add")
                    .opacity(vm.simpleToolName.isEmpty ? 0.5 : 1)
                
            }.disabled(vm.simpleToolName.isEmpty)
        }
        .padding()
    }
}

#Preview {
    AddToolsView(vm: ToolsViewModel())
}
