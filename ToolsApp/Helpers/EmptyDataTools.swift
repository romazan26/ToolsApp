//
//  EmptyDataTools.swift
//  ToolsApp
//
//  Created by Роман on 02.01.2025.
//

import SwiftUI

struct EmptyDataTools: View {
    var body: some View {
        VStack {
            Image(.empty)
                .resizable()
                .frame(width: 128, height: 128)
            Text("We haven't added any tools yet.")
        }
    }
}

#Preview {
    EmptyDataTools()
}
