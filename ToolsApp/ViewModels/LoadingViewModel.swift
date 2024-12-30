//
//  LoadingViewModel.swift
//  ToolsApp
//
//  Created by Роман on 30.12.2024.
//

import Foundation
import SwiftUI

final class LoadingViewModel: ObservableObject {
    
    @Published var isLoadingMain: Bool = false
    @Published var isLoadingOnBoard: Bool = false
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool?
    
    private var timerTime = 0
    
    init(){
        startLoading()
    }
    
    func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { [self] timer in
            if timerTime > 99 {
                timer.invalidate()
                if isFirstLaunch ?? true {
                    isLoadingOnBoard = true
                }else {
                    isLoadingMain = true
                }
                
            }else{
                timerTime += 1
                print(timerTime)
            }
        }
        
    }
}
