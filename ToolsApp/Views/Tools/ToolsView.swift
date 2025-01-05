//
//  ToolsView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct ToolsView: View {
    @StateObject var vm = ToolsViewModel()
    var body: some View {
                //MARK: - Main stack
            VStack(spacing: 20) {
                HStack{
                    Text("Tools")
                        .font(.system(size: 32))
                    Spacer()
                }
                    //MARK: - Tags
                    Divider()
                    HStack{
                        Button {
                            vm.presentesTagsView()
                        } label: {
                            TagButtonView(text: "Tags", image: "slider.horizontal.3", isActive: !vm.typeTags.isEmpty || !vm.coditionTags.isEmpty ? true : false)
                                .padding(.top, 10)
                        }
                        ScrollView(.horizontal) {
                            HStack{
                                
                                ForEach(vm.typeTags, id: \.self) { tag in
                                    Button {
                                        vm.deleteTypeTags(tag: tag)
                                        vm.getSortTools()
                                    } label: {
                                        TagButtonView(text: tag, isActive: false, delete: true)
                                            .padding(.top, 10)
                                    }
                                }
                                
                                ForEach(vm.coditionTags, id: \.self) { tag in
                                    Button {
                                        vm.deleteConditionTags(tag: tag)
                                        vm.getSortTools()
                                    } label: {
                                        TagButtonView(text: tag, isActive: false, delete: true)
                                            .padding(.top, 10)
                                    }
                                }
                            }
                        }
                        Spacer()
                    }
                    //MARK: - Add tools button
                    HStack{
                        Text("Your tools")
                            .font(.system(size: 22))
                            .foregroundStyle(.black)
                        Spacer()
                        
                        Button {
                            vm.presentAddToolView()
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                        }
                        
                    }
                
                    //MARK: - Tools list
                    if vm.tools.isEmpty {
                        EmptyDataTools()
                    }else{
                        ScrollView {
                            ForEach(vm.sortesTools) { tool in
                                Button {
                                    vm.presentedToolView()
                                    vm.simpleTool = tool
                                    vm.feelData()
                                    
                                } label: {
                                    ToolCellView(tool: tool, vm: vm)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                .padding()
                .navigationTitle("Tools")
                .sheet(isPresented: $vm.isPresentAddToolView) {
                    AddToolsView(vm: vm)
                        .presentationDetents([.fraction(0.75)])
                        .presentationDragIndicator(.visible)
                }
                .sheet(isPresented: $vm.isPresentToolView) {
                    ToolView(vm: vm)
                        .presentationDetents([.fraction(0.75)])
                        .presentationDragIndicator(.visible)
                }
                .sheet(isPresented: $vm.isPresentTagsView) {
                    TagsView(vm: vm)
                        .presentationDetents([.fraction(0.4)])
                        .presentationDragIndicator(.visible)
                }
        
    }
}

#Preview {
    ToolsView()
}
