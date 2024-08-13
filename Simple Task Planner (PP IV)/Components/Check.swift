//
//  Check.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 13.08.24.
//

import SwiftUI

struct Check: View {
    @Binding var status: Status
    
    var body: some View {
        VStack {
            Button(action: {
                status = (status != .done) ? .done : .pending
            }) {
                Image(systemName: getImage(status))
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(getColor(status))
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
    
    private func getImage(_ status: Status) -> String {
        switch status {
        case .pending:
            return "circle"
        case .ongoing:
            return "hammer.circle.fill"
        case .paused:
            return "pause.circle.fill"
        case .done:
            return "checkmark.circle.fill"
        }
    }
    
    private func getColor(_ status: Status) -> Color {
        switch status {
        case .pending:
            return .gray
        case .ongoing:
            return .blue
        case .paused:
            return .orange
        case .done:
            return .green
        }
    }
}
