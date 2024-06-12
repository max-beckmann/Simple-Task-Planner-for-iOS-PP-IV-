//
//  ConfigurationElement.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 12.06.24.
//

import SwiftUI

struct ConfigurationElement<Content: View>: View {
    private let text: String
    private let content: () -> Content
    
    init(text: String, @ViewBuilder content: @escaping () -> Content) {
        self.text = text
        self.content = content
    }
    
    var body: some View {
        HStack(spacing: 8) {
            Text("\(text)")
            Spacer()
            content()
        }
        .padding(8)
        .background(.white)
        .cornerRadius(8)
    }
}
