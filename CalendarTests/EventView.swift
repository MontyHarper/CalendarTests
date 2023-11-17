//
//  EventView.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/4/23.
//

import Foundation
import SwiftUI

struct EventViewModel: Identifiable, Hashable {
    var id = UUID()
    var label: String
    var xPosition: Double
    var mode: Mode
    enum Mode {
        case regular
        case demoted
        var isRegular: Bool {
            self == .regular
        }
    }
}

// This view represents an event on the timeline.
struct EventView: View {
    var viewModel: EventViewModel
    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.mode.isRegular ? viewModel.label : " ")
                .lineLimit(1)
                .fontWidth(.condensed)
            Circle()
                .stroke(viewModel.mode.isRegular ? .yellow :  .black, lineWidth: 1.0)
                .frame(width:22, height:22)
        }
        .xPosition(viewModel.xPosition)
        .mode(viewModel.mode)
    }
}
    
