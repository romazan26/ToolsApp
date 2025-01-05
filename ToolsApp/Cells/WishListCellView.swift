//
//  WishListCellView.swift
//  ToolsApp
//
//  Created by Роман on 05.01.2025.
//

import SwiftUI

struct WishListCellView: View {
    @ObservedObject var wishList: WishList
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(wishList.name ?? "")
                    .foregroundStyle(.black)
                    .font(.system(size: 22))
                Spacer()
            }
           
            ConditionCellView(title: wishList.type ?? "", isAcctive: true)
        }
        .padding()
        .background {
            Color(wishList.confirm ? .donePlan : .grayApp)
                .cornerRadius(20)
        }
    }
}

#Preview {
    WishListCellView(wishList: WishList())
}
