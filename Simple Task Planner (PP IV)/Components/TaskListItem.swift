//
//  TaskListItem.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 11.06.24.
//

import SwiftUI

struct TaskListItem: View {
    var task: Task = Task(identifier: "", title: "Test", desc: "", priority: .high, dueOn: Date(), expenditure: .M)
    
    var body: some View {
        NavigationLink(destination: TaskView(task: task)) {
            Text("\(task.title)")
            HStack {
                StatusBadge(status: task.status)
            }
            .padding(.leading, 12)
        }
    }
}

#Preview {
    TaskListItem()
}
