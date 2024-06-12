//
//  TaskView.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 11.06.24.
//

import SwiftUI

struct TaskView: View {
    @State var task: Task = Task(identifier: "", title: "Test", desc: "", priority: .high, dueOn: Date(), expenditure: .M)
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Update status:")
                Spacer()
                Picker("Update status", selection: $task.status) {
                    ForEach(Status.allCases, id: \.self) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .navigationTitle("\(task.title)")
        .toolbar {
            ToolbarItem(placement: .principal) {
                StatusBadge(status: task.status)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: markAsDone) {
                    Text("mark as done")
                }
            }
        }
    }
    
    private func markAsDone() {
        withAnimation {
            task.status = Status.done
        }
    }
}

#Preview {
    TaskView()
}
