//
//  ConfigurationView.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var title: String = ""
    
    var body: some View {
        VStack {
            Text("ConfigurationView")
                .font(.largeTitle)
                .bold()
            TextField("Enter a title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: addTask) {
                Text("hinzufügen")
            }
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(identifier: "123456789", title: title, desc: "")
            modelContext.insert(newTask)
        }
    }
}

#Preview {
    ConfigurationView()
}
