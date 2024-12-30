//
//  PageIntroModel.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import Foundation

struct PageIntro: Identifiable,Equatable {
    let id = UUID()
    var imageUrl: String
    var text: String
    var tag: Int

    static var samplePage = PageIntro(imageUrl: "onboard1", text: "Organize your garage: track tools, monitor their condition, and plan your projects.", tag: 0)
    
    static var sampalePages: [PageIntro] = [
        PageIntro(imageUrl: "onboard1", text: "Organize your garage: track tools, monitor their condition, and plan your projects.", tag: 0),
        PageIntro(imageUrl: "onboard2", text: "Add tools to your garage, track their status, and keep them in top condition.", tag: 1),
        PageIntro(imageUrl: "onboard3", text: "Create project lists, track progress, and share wishlists with friends.", tag: 1)
    ]
}
