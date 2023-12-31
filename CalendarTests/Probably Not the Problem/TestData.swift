//
//  TestData.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/2/23.
//

import Foundation
import SwiftUI

// This class generates the test data to display.

class TestData: ObservableObject {
    
    @Published var demoted: [Int] = []
    private(set) var eventViewModels: [EventViewModel] = []
    private(set) var demotedEventViewModels: [EventViewModel] = []
    var dateViews: [DateView] = []
    
    let labels = ["breakfast","lunch","dinner with family","dinner","exercise","doctor appointment"]
    let dates = ["Aug 9", "Aug 10", "Aug 11", "Aug 12", "Aug 13", "Aug 14", "Aug 15", "Aug 16", "Aug 17", "Aug 18", "Aug 19"]
    let number = 10 // number of views to generate
    
    // Generates event views with random xPositions in Unit Space
    func makeEvents() {
        eventViewModels = (0..<number).map { index in
            .init(label: labels.randomElement()!, xPosition: Double.random(in: 0.0...1.0), mode: .regular)
        }
        demotedEventViewModels = eventViewModels.map { .init(label: $0.label, xPosition: $0.xPosition, mode: .demoted)}
    }
    
    // Generates date views - not currently testing
    func makeDatesArray() {
        for n in 0...number {
            dateViews.append(DateView(label:dates[n], xPosition: Double(n) * (1.0/Double(number))))
        }
    }
    
    // An instance of TestData will automatically generate arrays of views.
    init() {
        makeEvents()
        makeDatesArray()
    }
    
   
}
