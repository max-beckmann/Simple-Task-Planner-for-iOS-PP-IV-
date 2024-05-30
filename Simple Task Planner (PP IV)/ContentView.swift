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
        VStack {
            NavigationStack {
                ZStack {
                    if(tasks.isEmpty) {
                        Text("no tasks found")
                            .foregroundColor(.gray)
                    } else {
                        List {
                            ForEach(tasks) { task in
                                NavigationLink {
                                    Text("Task \(task.identifier)")
                                } label: {
                                    Text("\(task.title)")
                                }
                            }
                            .onDelete(perform: deleteTasks)
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                EditButton()
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            NavigationLink(destination: ConfigurationView()) {
                                ZStack {
                                    Circle()
                                        .frame(width: 36, height: 36)
                                        .foregroundColor(.brown)
                                    Image(systemName: "plus")
                                        .foregroundColor(.white)
                                        .imageScale(.medium)
                                }
                            }
                            .padding()
                        }
                    }
                    .zIndex(2)
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
