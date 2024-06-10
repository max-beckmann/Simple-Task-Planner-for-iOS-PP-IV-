//
//  Task.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import Foundation
import SwiftData

enum Priority: String, CaseIterable, Codable {
    case none
    case low
    case medium
    case high
}

enum Status: String, CaseIterable, Codable {
    case pending
    case inProgress
    case paused
    case done
}

@Model
class Task {
    @Attribute(.unique) var identifier: String
    var title: String
    var desc: String
    var priority: Priority
    var dueOn: Date
    var expenditure: Int
    var status: Status = Status.pending
    
    init(identifier: String, title: String, desc: String, priority: Priority, dueOn: Date, expenditure: Int) {
        self.identifier = identifier
        self.title = title
        self.desc = desc
        self.priority = priority
        self.dueOn = dueOn
        self.expenditure = expenditure
    }
}
