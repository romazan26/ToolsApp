//
//  TypeTools.swift
//  ToolsApp
//
//  Created by Роман on 01.01.2025.
//

import Foundation

enum TypeTools: CaseIterable {
    case hand
    case power
    case measuring
    case cutting
    
    var name: String {
        switch self {
        case .hand: return "Hand Tool"
        case .power: return "Power Tool"
        case .measuring: return "Measuring Tool"
        case .cutting: return "Cutting Tool"
        }
    }
    
}
