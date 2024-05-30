//
//  Task.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 30.05.24.
//

import Foundation
import SwiftData

@Model
class Task {
    @Attribute(.unique) var identifier: String
    var title: String
    var desc: String
    
    init(identifier: String, title: String, desc: String) {
        self.identifier = identifier
        self.title = title
        self.desc = desc
    }
}
