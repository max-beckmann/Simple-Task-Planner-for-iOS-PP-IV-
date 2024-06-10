//
//  ConfigurationView.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var priority: Priority = .none
    @State private var selectedDate: Date = Date()
    @State private var expenditure: String = ""
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("Enter a title", text: $title)
                .textFieldStyle(.roundedBorder)
            TextField("Enter a description", text: $desc, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .lineLimit(3...5)
            Picker("Select the priority", selection: $priority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue).tag(priority)
                }
            }
            .pickerStyle(.segmented)
            DatePicker("Select the due date", selection: $selectedDate, displayedComponents: .date)
            TextField("Enter the expected expenditure (in hours)", text: $expenditure)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .navigationTitle("New task")
        .toolbar {
            ToolbarItem {
                Button(action: {
                    addTask()
                    dismiss()
                }) {
                    Text("add")
                }
            }
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(
                identifier: "123456789",
                title: title,
                desc: desc,
                priority: priority,
                dueOn: selectedDate,
                expenditure: Int(expenditure) ?? 0
            )
            modelContext.insert(newTask)
        }
    }
}

#Preview {
    ConfigurationView()
}
