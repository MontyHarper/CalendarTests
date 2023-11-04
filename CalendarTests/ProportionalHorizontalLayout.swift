//
//  ProportionalHorizontalLayout.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/3/23.
//
//  This is Josh's original solution.
//  Adjustments to make:
//      Only the label disappears
//      First label is always included
//      Views can be anywhere on x axis
//

import Foundation
import SwiftUI


// Josh's original layout.
// I haven't changed a thing.

struct ProportionalHorizontalLayout: Layout {
    var minimumSpacing: CGFloat = 10
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let tallest = subviews.lazy.map {
            $0.sizeThatFits(.init(width: proposal.width, height: nil)).height
        }.max() ?? .zero
        return .init(width: proposal.width ?? .zero, height: tallest)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let frames = subviews.enumerated().map { index, view in
            let size = view.sizeThatFits(.unspecified)
            let proportion = Double(index) / Double(max(subviews.count - 1, 1))
            return CGRect(origin:
                    .init(
                        x: bounds.origin.x + bounds.width * proportion,
                        y: bounds.origin.y + bounds.height * 0.5
                    )
                          , size: .zero
            )
            .insetBy(dx: -size.width / 2, dy: -size.height / 2)
        }
        let decimation = [
            subviews.indices.lazy.filter { _ in true },
            subviews.indices.lazy.filter { !$0.isMultiple(of: 4) },
            subviews.indices.lazy.filter { !$0.isMultiple(of: 3) },
            subviews.indices.lazy.filter { $0.isMultiple(of: 2) },
            subviews.indices.lazy.filter { $0.isMultiple(of: 3) },
            subviews.indices.lazy.filter { $0.isMultiple(of: 4) },
            subviews.indices.lazy.filter { $0.isMultiple(of: 6) },
            subviews.indices.lazy.filter { _ in false },
        ]
        let bestFit = decimation.first { indicies in
            zip(indicies, indicies.dropFirst())
                .allSatisfy { left, right in
                    frames[left].maxX + minimumSpacing < frames[right].minX
                }
        }.map(Set.init) ?? []
        
        
        let nowhere = CGPoint(x: 1e12, y: 1e12)
        for (index, view) in subviews.enumerated() {
            let frame = frames[index]
            view.place(
                at: bestFit.contains(index) ? frame.origin : nowhere,
                anchor: .topLeading,
                proposal: .init(width: frame.size.width, height: frame.size.height)
            )
        }
    }
}
