//
//  StatusBadge.swift
//  Simple Task Planner (PP IV)
//
//  Created by Max Beckmann on 11.06.24.
//

import SwiftUI

struct StatusBadge: View {
    var status: Status = Status.pending
    
    var body: some View {
        Capsule()
            .fill(status.color())
            .frame(width: 80, height: 24)
            .overlay(
                Text("\(status)")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .font(.system(size: 14))
            )
    }
}

#Preview {
    StatusBadge()
}
