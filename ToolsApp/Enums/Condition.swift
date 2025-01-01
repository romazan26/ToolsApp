//
//  Condition.swift
//  ToolsApp
//
//  Created by Роман on 01.01.2025.
//

import Foundation

enum Condition: String, CaseIterable{
    case new
    case inUse
    case functional
    case needsMaintenance
    
    var name: String{
        switch self{
        case .new: return "New"
        case .inUse: return "In Use"
        case .functional: return "Functional"
        case .needsMaintenance: return "Needs Maintenance"
        }
    }
}
