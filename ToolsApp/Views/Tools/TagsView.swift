//
//  TagsView.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct TagsView: View {
    @StateObject var vm: ToolsViewModel
    var body: some View {
        VStack(spacing: 20){
            HStack{
                Spacer()
                Text("Tags")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
                Button {
                    vm.presentesTagsView()
                    vm.addTypeAll()
                    vm.addConitionAll()
                    vm.getSortTools()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                
            }
            .padding(.top)
            //MARK: - Tool condition
            VStack(alignment: .leading){
                Text("Tool Condition")
                ScrollView(.horizontal) {
                    HStack {
                        Button {
                            vm.addConitionAll()
                        } label: {
                            ConditionCellView(title: "All", isAcctive: vm.coditionTags.isEmpty ? true : false)
                        }

                        ForEach(Condition.allCases, id: \.self) { condition in
                            Button {
                                vm.addConditionTags(condition: condition)
                            } label: {
                                ConditionCellView(title: condition.name, isAcctive: vm.cheackConditionTags(condition: condition))
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
                        Button {
                            vm.addTypeAll()
                        } label: {
                            ConditionCellView(title: "All", isAcctive: vm.typeTags.isEmpty ? true : false)
                        }
                        ForEach(TypeTools.allCases, id: \.self) { type in
                            Button {
                                vm.addTypeTags(type: type)
                            } label: {
                                ConditionCellView(title: type.name, isAcctive: vm.cheackTypeTags(type: type))
                            }
                        }
                    }
                }.scrollIndicators(.hidden)
            }
            
            //MARK: - Button group
            HStack{
                Button {
                    vm.addTypeAll()
                    vm.addConitionAll()
                } label: {
                    ZStack {
                        Color(.grayApp)
                            .frame(height: 36)
                            .cornerRadius(100)
                        Text("Reset")
                            .foregroundStyle(.black)
                    }
                }
                Button {
                    vm.presentesTagsView()
                    vm.getSortTools()
                } label: {
                    ZStack {
                        Color(.grayApp)
                            .frame(height: 36)
                            .cornerRadius(100)
                        Text("Apply and close")
                            .foregroundStyle(.black)
                    }
                    .opacity(vm.typeTags .isEmpty && vm.coditionTags.isEmpty ? 0.5 : 1)
                }.disabled(vm.typeTags .isEmpty && vm.coditionTags.isEmpty ? true : false)

                
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    TagsView(vm: ToolsViewModel())
}
