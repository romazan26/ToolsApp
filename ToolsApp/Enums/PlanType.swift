//
//  PlanType.swift
//  ToolsApp
//
//  Created by Роман on 03.01.2025.
//

import Foundation

enum PlanType: String, CaseIterable{
    case home
    case car
    case walding
    case garden
    
    var title: String{
        switch self{
        case .home: return "Home Repairs"
        case .car: return "Car Repairs"
        case .walding: return "Welding Projects"
        case .garden: return "Garden Repairs"
        }
    }
}
