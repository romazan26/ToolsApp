//
//  AddToolsView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI

struct AddToolsView: View {
    @StateObject var vm: ToolsViewModel
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Text("New tool")
                    .font(.system(size: 22))
                Spacer()
                Button {
                    vm.isPresentAddToolView = false
                } label: {
                    Image(systemName: "xmark")
                }

            }.foregroundStyle(.black)
            
            VStack(alignment: .leading){
                Text("Card icon")
                ScrollView(.horizontal) {
                        HStack {
                        ForEach(Card.allCases, id: \.self) { card in
                            CardCellView(image: card.image)
                                .padding(9)
                        }
                    }
                }
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
    AddToolsView(vm: ToolsViewModel())
}
