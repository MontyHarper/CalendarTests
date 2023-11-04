//
//  EventView.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/4/23.
//

import Foundation
import SwiftUI

// An event view's mode determines whether it shows its label or not
enum Mode {
    case regular
    case demoted
}

// This view represents an event on the timeline.
struct EventView: View, Identifiable {
    var id = UUID()
    var label: String
    var xPosition: Double
    var mode: Mode
    
    var body: some View {
        
        switch mode {
            
            // In regular mode, show a text label
        case .regular:
            
            VStack {
                Text(label)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .allowsTightening(true)
                Circle()
                    .stroke(.yellow, lineWidth: 1.0)
                    .frame(width:22, height:22, alignment: .center)
                    .offset(y:-10.0)
                    .foregroundColor(.blue)
                
                
            }
            
            // In demoted mode, show no text label
        case .demoted:
            VStack {
                Text(" ")
                    .multilineTextAlignment(.center)
                Circle()
                    .stroke(.black, lineWidth: 1.0)
                    .frame(width:22, height:22, alignment: .center)
                    .offset(y:-10.0)
                    .foregroundColor(.blue)
                
            }
        }
    }
}
    
