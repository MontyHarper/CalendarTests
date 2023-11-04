//
//  EventView.swift
//  Testing2
//
//  Created by Monty Harper on 10/14/23.
//

import Foundation
import SwiftUI

struct EventView: View {
    

    var title: String
    var size: Double = 25.0
    
    var xLocation: Double
    
    init(title: String, xLocation: Double) {

        self.title = title
        self.xLocation = xLocation
    }
    
    var body: some View {
        
        
        Circle()
            .fill(.yellow)
            .frame(width: size, height: size)
            .overlay(
                Text(title).fixedSize().offset(y: -size), alignment: .bottom)
            .overlay(
                Image(systemName: "arrow.right")
                    .offset(x: -size*0.61),
                alignment: .init(horizontal: .center, vertical: .center))
        
    }
}

