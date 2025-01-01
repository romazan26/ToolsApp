//
//  ToolsViewModel.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//

import Foundation

final class ToolsViewModel: ObservableObject {
    @Published var isPresentAddToolView: Bool = false
    
    @Published var simpleToolName: String = ""
    @Published var simpleToolManufactures: String = ""
    @Published var simpleToolPrice: String = ""
    @Published var simpleToolManual: String = ""
    @Published var simpleCard: Card = .compass
    @Published var simpleToolCondition: Condition = .new
    @Published var simpleType: TypeTools = .hand
    @Published var simpleAnotherType: String = ""
    
    func presentAddToolView() {
        isPresentAddToolView.toggle()
    }
    
    //MARK: - Cheak isActive tool
    func cheakIsActiveCard(card: Card) -> Bool {
        if card == simpleCard {
            return true
        }else{
            return false
        }
    }
    
    func cheakIsActiveCondition(condition: Condition) -> Bool {
        if condition == simpleToolCondition {
            return true
        }else{
            return false
        }
    }
    
    func cheatIsActiveType(type: TypeTools) -> Bool {
        if type == simpleType {
            return true
        }else{
            return false
        }
    }
}
