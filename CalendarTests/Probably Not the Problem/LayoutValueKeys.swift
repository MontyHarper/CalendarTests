//
//  LayoutValueKeys.swift
//  CalendarTests
//
//  Created by Monty Harper on 9/9/23.
//

import Foundation
import SwiftUI

// Keys used to pass values associated with each view into the custom layout.

struct xPositionKey: LayoutValueKey {
    static let defaultValue: CGFloat = 0.0
}

struct modeKey: LayoutValueKey {
    static let defaultValue: EventViewModel.Mode = .regular
}

extension View {
    func xPosition(_ percent: CGFloat) -> some View {
        layoutValue(key: xPositionKey.self, value: percent)
    }
    
    func mode(_ mode: EventViewModel.Mode) -> some View {
        layoutValue(key: modeKey.self, value: mode)
    }
}
