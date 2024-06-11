//
//  ContentView.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]

    var body: some View {
        NavigationStack {
            HStack {
                if(tasks.isEmpty) {
                    Text("no tasks found")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(tasks) { task in
                            TaskListItem(task: task)
                        }
                        .onDelete(perform: deleteTasks)
                    }
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                }
            }
            .navigationTitle("All tasks")
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    HStack {
                        Spacer()
                        AddTaskButton(size: 48)
                            .zIndex(2)
                    }
                }
            }
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Task.self, inMemory: true)
}
