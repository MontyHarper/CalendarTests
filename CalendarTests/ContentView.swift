//
//  ContentView.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/2/23.
//

import SwiftUI

// Main view, testing the display of Event Views in the timeline

struct ContentView: View {
    
    @StateObject var testData = TestData()
    
    // This is tied to the slider, to test the layout as available horizontal space is changed.
    // A viewWidth of 1.0 represents maximum width.
    @State private var viewWidth = 1.0
    
    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                
                Spacer()
                
                Text("Josh's Solution")
                
                // Josh's original solution works well for time labels, which are laid out at regular intervals.
                ProportionalHorizontalLayout(minimumSpacing: 10) {
                    ForEach(testData.eventViews) { item in
                        item
                    }
                }
                .frame(width:geo.size.width * viewWidth)
                .border(.blue)
                
                Spacer()
                
                
                // My goal is to place all the provided event views at specific locations in time (effectively random horizontal placement) while gracefully handling overlapping labels.
                
                // I use LayoutValueKeys to pass .xPosition and .mode to the proxy views inside the layout.
                
                Text("My Tweak of Josh's Solution")
                    
                    ZStack {

                        // I use this layout twice, one atop the other.
                        // This first layout displays event views with labels, placing views that don't fit off screen.
                        // These views show a yellow circle
                        NewHL2 {
                            ForEach(testData.eventViews) { event in
                                event
                                    .xPosition(event.xPosition)
                                    .mode(.regular)
                            }
                        }
                        
                        // This second layout displays all event views without labels. This allows all views to be represented, even if their labels don't fit.
                        // These views show a black circle
                        // Observed weirdness:
                        //  - Every view should be represented, but some black circles are missing
                        //  - Black and yellow circles should line up exactly but they don't
                        //  - Text labels are truncated, even when requesting .infinity for the view width.
                        // - Views sometimes are rendered to the left of available space, when xPositions all lie between 0 and 1.
                        
                                
                        NewHL2 {
                            ForEach(testData.eventViews.map({EventView(label: $0.label, xPosition: $0.xPosition, mode: .demoted)})) { event in
                                event
                                    .xPosition(event.xPosition)
                                    .mode(.demoted)
                            }
                        }
                    }

                .frame(width: geo.size.width * viewWidth)
                .border(.blue)
                
                
                
//                Text("My Original Solution, Dates")
//
//
//
//                    ZStack {
//                        ForEach(testData.dateViews) { view in
//                            view
//                                .frame(maxWidth: 100)
//                                .position(x: view.xPosition * geo.size.width * viewWidth, y: 0.15 * geo.size.height)
//                        }
//                    }
//                .frame(width:geo.size.width * viewWidth)
//                    .border(.blue)
                    
                Spacer()
                
                Slider(value: $viewWidth, in: 0...1)
                
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


