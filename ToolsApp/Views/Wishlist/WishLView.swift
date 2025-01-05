//
//  WishLView.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import SwiftUI

struct WishLView: View {
    @StateObject var vm: WishlistViewModel
    @State private var presentDeleteAlert: Bool = false
    var body: some View {
        VStack{
            HStack{
                Button {
                    vm.presentWishLView()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundStyle(.black)
                }
                
                Spacer()

                if let list = vm.simpleWishlist{
                    Text(list.name ?? "")
                        .font(.system(size: 22))
                }
               
                
                Spacer()
                
                //MARK: - Option button
                Menu("...") {
                    Button {vm.tapEditButon()} label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    Button {vm.isPresentShare.toggle()} label: {
                        Label("Share", systemImage: "square.and.arrow.up")
                    }
                    Button(role: .destructive, action: {
                        presentDeleteAlert = true
                    }) {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }.padding(.vertical)
            if let list = vm.simpleWishlist{
                VStack(alignment: .leading, content: {
                    HStack {
                        Text("Tool Type")
                            .font(.system(size: 12))
                        Spacer()
                    }
                    Text(list.type ?? "")
                        .font(.system(size: 16))
                })
            }
            
            Spacer()
            
            Button {
                vm.confirmList()
                vm.presentWishLView()
            } label: {
                MainButtonView(text: "Confirm your wish", isactive: true)
            }

        }
        .padding()
        .sheet(isPresented: $vm.isPresentShare, content: {
            ShareSheet(items: vm.simpleWishlist?.name ?? "" )
        })
        .alert("Delete tool?", isPresented: $presentDeleteAlert) {
                        Button("Cancel", role: .cancel) {
                            presentDeleteAlert = false
                        }
                        Button("Delete", role: .destructive) {
                            vm.deleteList()
                            vm.presentWishLView()
                        }
                    } message: {
                        Text("Are you sure you want to delete this tool? This action cannot be undone.")
                    }
    }
}

#Preview {
    WishLView(vm: WishlistViewModel())
}
