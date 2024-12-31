//
//  Card.swift
//  ToolsApp
//
//  Created by Роман on 31.12.2024.
//
import Foundation
import SwiftUI

enum Card: String, CaseIterable {
    case hammer
    case screwdriver
    case wrench
    case paintbrush
    case scissors
    case compass
    case ruler
    
    var image: Image {
        switch self {
        case .hammer: return Image(systemName: "hammer.fill")
        case .screwdriver: return Image(systemName: "screwdriver.fill")
        case .wrench: return Image(systemName: "wrench.adjustable.fill")
        case .paintbrush: return Image(systemName: "paintbrush.fill")
        case .scissors: return Image(systemName: "scissors")
        case .compass: return Image(systemName: "compass.drawing")
        case .ruler: return Image(systemName: "ruler.fill")
        }
    }
}
