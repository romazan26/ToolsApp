//
//  WishlistView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct WishlistView: View {
    
    @StateObject var vm = WishlistViewModel()
    
    var body: some View {
        VStack{
            //MARK: - Title view
            HStack{
                Text("Wishlist")
                    .font(.system(size: 32))
                Spacer()
            }
            Divider()
            
            //MARK: - Add button
            HStack{
                Text("Your Wishlist")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
                Button {
                    vm.presentAddView()
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.black)
                }

            }
            
            if vm.wishlists.isEmpty {
                VStack{
                    Image(.emptyWishlist)
                        .resizable()
                        .frame(width: 128, height: 128)
                    Text("You don't have any tools on your wishlist yet.")
                    Spacer()
                }
            }else{
                ScrollView {
                    ForEach(vm.wishlists) { wishlist in
                        Button {
                            vm.presentWishLView()
                            vm.simpleWishlist = wishlist
                        } label: {
                            WishListCellView(wishList: wishlist)
                        }
                    }
                }
            }
            
            
        }
        .padding()
        .sheet(isPresented: $vm.isPresentAddView) {
            AddWishlistView(vm: vm)
                .presentationDetents([.fraction(0.35)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $vm.isPresentWishLView) {
            WishLView(vm: vm)
                .presentationDetents([.fraction(0.35)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    WishlistView()
}
