//
//  ContentView.swift
//  ToolsApp
//
//  Created by Роман on 30.12.2024.
//

import SwiftUI

struct LadingView: View {
    @StateObject var vm = LoadingViewModel()
    var body: some View {
        VStack {
            Spacer()
            Image(.logo)
                .resizable()
                .frame(width: 200, height: 200)
            Spacer()
            HStack {
                ProgressView()
                Text("Loading...")
                    .font(.system(size: 17))
            }
            .foregroundStyle(.gray)
            .offset(y: -100)
        }
        .fullScreenCover(isPresented: $vm.isLoadingMain, content: {
            RootView()
        })
        .fullScreenCover(isPresented: $vm.isLoadingOnBoard, content: {
            IntroView()
        })
        .padding()
    }
}

#Preview {
    LadingView()
}
