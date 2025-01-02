//
//  ToolView.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct ToolView: View {
    @StateObject var vm: ToolsViewModel
    @State private var presentDeleteAlert: Bool = false
    var body: some View {
        
        VStack{
            //MARK: - top toolbar
            HStack{
                //MARK: - Clouse button
                Button(action: {vm.presentedToolView()}) {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                Spacer()
                //MARK: - Name tool
                Text(vm.simpleTool?.name ?? "")
                    .font(.system(size: 22))
                Spacer()
                
                //MARK: - Option button
                Menu("...") {
                    Button {vm.tapEditeButton()} label: {
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
            
            ScrollView{
                ConditionBar(condition: vm.simpleTool?.condition ?? "")
                
                ToolsGridDataView(condition: vm.simpleTool?.condition ?? "",
                                  manufacturer: vm.simpleTool?.manufactures ?? "",
                                  toolTipe: vm.simpleTool?.type ?? "",
                                  price: "\(String(format: "%.2f", vm.simpleTool?.price ?? 0))")
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Manual")
                        Spacer()
                    }
                    
                    Text(vm.simpleTool?.manual ?? "")
                }
                .frame(maxWidth: .infinity)
                .padding(8)
                .background {
                    Color.grayApp.cornerRadius(20)
                }
            }
            Spacer()
        }
        .padding()
        .alert("Delete tool?", isPresented: $presentDeleteAlert) {
                        Button("Cancel", role: .cancel) {
                            presentDeleteAlert = false
                        }
                        Button("Delete", role: .destructive) {
                            vm.deleteData()
                            vm.presentedToolView()
                        }
                    } message: {
                        Text("Are you sure you want to delete this tool? This action cannot be undone.")
                    }
        
        
    }
}

#Preview {
    ToolView(vm: ToolsViewModel())
}
