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
        NavigationStack {
                //MARK: - Main stack
                VStack {
                    //MARK: - Tags
                    HStack {
                        Button {
                            ///
                        } label: {
                            TagButtonView(text: "Tags", image: "slider.horizontal.3", isActive: false)
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
                            vm.isPresentAddToolView = true
                        } label: {
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
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
        }
    }
}

#Preview {
    ToolsView()
}
