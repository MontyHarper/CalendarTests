//
//  SubView.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/2/23.
//

import Foundation
import SwiftUI


// This view will represent time intervals along the top of the calendar.
// Not currently testing this in ContentView
struct DateView: View, Identifiable {
    var id = UUID()
    var label: String
    var xPosition: Double
    
    var body: some View {
        
        VStack {
            Text(label)
                .multilineTextAlignment(.center)
            Text("▼")
        }
    }
}


