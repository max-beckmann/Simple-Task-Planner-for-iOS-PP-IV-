//
//  AddTaskButton.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 10.06.24.
//

import SwiftUI

struct AddTaskButton: View {
    var size: CGFloat = 36
    
    var body: some View {
        NavigationLink(destination: ConfigurationView()) {
            ZStack {
                Circle()
                    .frame(width: size, height: size)
                    .foregroundColor(.brown)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .imageScale(.large)
            }
        }
    }
}

#Preview {
    AddTaskButton()
}
