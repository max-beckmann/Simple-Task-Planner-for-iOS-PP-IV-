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
    @State private var showDatePicker = false
    @State private var title: String = ""
    @State private var desc: String = ""
    @State private var priority: Priority = .none
    @State private var selectedDate: Date = Date()
    @State private var expenditure: TShirtSize = .M
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                TextField("Enter a title", text: $title)
                    .padding(8)
                    .background(.white)
                    .cornerRadius(8, corners: [.topLeft, .topRight])
                Divider()
                    .background(Color(UIColor.systemGray6))
                TextField("Enter a description", text: $desc, axis: .vertical)
                    .padding(8)
                    .background(.white)
                    .cornerRadius(8, corners: [.bottomLeft, .bottomRight])
                    .lineLimit(3...5)
            }
            ConfigurationElement(text: "Due on") {
                if showDatePicker {
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                } else {
                    Button(action: {
                        withAnimation {
                            showDatePicker.toggle()
                        }
                    }) {
                        Image(systemName: "plus")
                            .font(.headline)
                            .frame(alignment: .trailing)
                    }
                }
            }
            ConfigurationElement(text: "Priority") {
                Picker("", selection: $priority) {
                    ForEach(Priority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 220)
            }
            ConfigurationElement(text: "Expenditure") {
                Picker("", selection: $expenditure) {
                    ForEach(TShirtSize.allCases, id: \.self) { size in
                        Text(size.rawValue).tag(size)
                    }
                }
                .pickerStyle(.segmented)
                .frame(maxWidth: 220)
            }
            Spacer()
        }
        .padding(.horizontal)
        .padding(.top, 16)
        .navigationTitle("New task")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button(action: {
                    addTask()
                    dismiss()
                }) {
                    Text("Add")
                }
            }
        }
        .background(Color(UIColor.systemGray6))
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(
                identifier: "123456789",
                title: title,
                desc: desc,
                priority: priority,
                dueOn: selectedDate,
                expenditure: expenditure
            )
            modelContext.insert(newTask)
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

#Preview {
    ConfigurationView()
}
