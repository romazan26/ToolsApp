//
//  SettingsView.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    @State var urlPolicy = "https://www.termsfeed.com/live/370c94ea-de3f-4e1d-b217-4ab76aca7680"
    
    var body: some View {
        
        VStack(spacing: 25){
            //MARK: - Toolbar
            HStack {
               
                Text("Settings")
                    .foregroundStyle(.black)
                    .font(.system(size: 34))
                    
                Spacer()
                
            }
            
            Divider()
            
            //MARK: - Share App Button
            Button(action: {isPresentShare.toggle()}, label: {
                SettingButton(text: "SHARE APP", imageName: "square.and.arrow.up")
            })
            
            
            //MARK: - Rate App Button
            Button {
                SKStoreReviewController.requestReview()
            } label: {
                SettingButton(text: "RATE APP", imageName: "star")
            }
            
            //MARK: - Privacy button
            Button(action: {isPresentPolicy.toggle()}, label: {
                SettingButton(text: "PRIVACY POLICY", imageName: "text.document")
            })
            Spacer()
        }.padding()
        
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: urlPolicy)!)
        })
    }
    }


#Preview {
    SettingsView()
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
   



