//
//  AddWishlistView.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import SwiftUI

struct AddWishlistView: View {
    @StateObject var vm: WishlistViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text(vm.isEditMode ? "Edit wihlist" : "New wihlist item")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
                Button {
                    vm.presentAddView()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                
            }
            .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 10){
                Text("Tool name")
                    .font(.system(size: 12))
                TextField("Enter tool name", text: $vm.toolName)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused)
            }
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10){
                Text("Tool type")
                    .font(.system(size: 12))
                TextField("Enter tool type", text: $vm.toolType)
                    .textFieldStyle(.roundedBorder)
                    .focused($isFocused)
            }
            
            Divider()
            
            Spacer()
            
            Button {
                if vm.isEditMode {
                    vm.saveEditData()
                }else{
                    vm.addData()
                }
                vm.presentAddView()
            } label: {
                MainButtonView(text: "Save and add", isactive: !vm.toolName.isEmpty)
            }
            .disabled(vm.toolName.isEmpty)
        }
        .onTapGesture {
            isFocused = false
        }
        .padding()
        .foregroundStyle(.black)
    }
}

#Preview {
    AddWishlistView(vm: WishlistViewModel())
}
