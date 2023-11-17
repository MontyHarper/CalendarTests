//
//  ProportionalHorizontalLayout.swift
//  CalendarTests
//
//  Created by Monty Harper on 10/31/23.
//
//  This is a copy of Josh's original solution.
//  Adjustments to make:
//      Only the label disappears
//      First label is always included
//      Views can display anywhere along x axis
//


import Foundation
import SwiftUI

struct NewHL2: Layout {
        
    var minimumSpacing: CGFloat = 10
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let tallest = subviews.lazy.map {
            $0.sizeThatFits(.init(width: proposal.width, height: nil)).height
        }.max() ?? .zero
        return .init(width: proposal.width ?? .zero, height: tallest)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        print("placeSubviews in NewHL2 Layout called.")
        
        
        // MARK: - Size/Locate each Subview
        // This creates a frame for each subview based on its size and location.
        // Even when I request .infinity, I am getting widths that do not accomodate the text in each subview.
        let frames = subviews.enumerated().map { index, view in
            let size = view.sizeThatFits(.unspecified)
            let proportion = view[xPositionKey.self]
            print("this view proxy has xPosition value: \(view[xPositionKey.self])")
            return CGRect(origin:
                    .init(
                        x: bounds.origin.x + bounds.width * proportion,
                        y: bounds.origin.y + bounds.height * 0.5
                    )
                          , size: .zero
            )
            .insetBy(dx: -size.width / 2, dy: -size.height / 2)
        }
        

        let sortedIndices = subviews.indices.sorted { subviews[$0][xPositionKey.self] < subviews[$1][xPositionKey.self] }

        var right: Int?
        let bestFit = Set(
            sortedIndices.filter { index in
                guard let rightIndex = right else {
                    right = index
                    return true
                }
                guard frames[rightIndex].maxX + minimumSpacing < frames[index].minX else { return false }
                right = index
                return true
            }
        )

        // MARK: - Place Subviews


        let nowhere = CGPoint(x: 1e12, y: 1e12)

        for index in sortedIndices {
            let frame = frames[index]
            let view = subviews[index]
            view.place(
                
                // Each view is placed on screen if either its label fits (member of bestFit), or its mode is "demoted".
                // The ContentView calls this layout in two layers. In the first layer all views are in .normal mode, so we place bestFit views onscreen and others off; in the second layer all views are in .demoted mode, so they should all be placed onscreen, without labels.
                // The two layers ought to line up but they don't.
                at: (bestFit.contains(index) || view[modeKey.self] == .demoted) ? frame.origin : nowhere,
                anchor: .topLeading,
                proposal: .init(width: frame.size.width, height: frame.size.height)
            )
        }
    }
}
