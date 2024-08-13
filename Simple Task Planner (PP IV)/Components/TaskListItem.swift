//
//  TaskListItem.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 11.06.24.
//

import SwiftUI

struct TaskListItem: View {
    @Binding var task: Task
    
    var body: some View {
        NavigationLink(destination: TaskView(task: task)) {
            HStack {
                Text("\(task.title)")
                Spacer()
                Check(status: $task.status)
            }
            .padding(.leading, 12)
        }
    }
}
