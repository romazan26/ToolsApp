//
//  IntroView.swift
//  FastTrack
//
//  Created by Роман on 12.08.2024.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            TabView(selection: $pageIndex,
                    content:  {
                
                    if pageIndex == 0{
                        Image(pages[pageIndex].imageUrl)
                            .resizable()
                            .ignoresSafeArea()
                    }else{
                        ZStack {
                            Image(.blurOnborad)
                                .resizable()
                                .ignoresSafeArea()
                            Image(pages[pageIndex].imageUrl)
                                .resizable()
                                .padding(30)
                        }
                    }
                
            })
            .ignoresSafeArea()
            .animation(.easeInOut, value: pageIndex)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            
            VStack{
                Text(pages[pageIndex].text)
                    .font(.system(size: 28))
                    .multilineTextAlignment(.center)
                HStack{
                    ForEach(0..<pages.count) { page in
                        if pageIndex == page{
                            Circle()
                                .frame(height: 10)
                                .foregroundStyle(.black)
                        }else{
                            Circle()
                                .frame(height: 10)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                //MARK: - Navigation Button
                Button(action: {
                    
                    print(pageIndex)
                    if pageIndex > pages.count - 2 {
                        isPresented = true
                        if isFirstLaunch ?? true{
                            isFirstLaunch = false
                        }
                    }else{
                        pageIndex += 1
                    }
                }, label: {
                   
                    MainButtonView(text: pageIndex > pages.count - 2 ? "Get started" : "Next")
                }).padding()
            }
            .padding()
            .background {
                Color.white.ignoresSafeArea()
            }
        }
        .fullScreenCover(isPresented: $isPresented, content: {
            RootView()
        })
        
    }
    
}

#Preview {
    IntroView()
}

