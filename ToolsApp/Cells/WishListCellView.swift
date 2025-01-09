//
//  WishListCellView.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import SwiftUI

struct WishListCellView: View {
    @ObservedObject var wishList: WishList
    @StateObject var vm: WishlistViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(wishList.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
            }
            HStack{
                ConditionCellView(title: wishList.type ?? "", isAcctive: true)
                Spacer()
                
                //MARK: Edit button
                Button {
                    vm.tapEditButtonOnCell(wishList: wishList)
                } label: {
                    Image(systemName: "pencil.line")
                        .foregroundStyle(.black)
                }

                //MARK: - Completed button
                Button {
                    vm.simpleWishlist = wishList
                    vm.confirmList()
                } label: {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(.green)
                }

                
                //MARK: Delete button
                Button {
                    vm.simpleWishlist = wishList
                    vm.isPresentAlertDelete = true
                } label: {
                    Image(systemName: "trash.fill")
                        .foregroundStyle(.main)
                }
            }
        }
        .padding()
        .background {
            Color(wishList.confirm ? .donePlan : .grayApp)
                .cornerRadius(20)
        }
    }
}

#Preview {
    WishListCellView(wishList: WishList(), vm: WishlistViewModel())
}
