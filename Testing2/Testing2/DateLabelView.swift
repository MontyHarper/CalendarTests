//
//  DateLabelView.swift
//  Testing2
//
//  Created by Monty Harper on 10/14/23.
//

import Foundation
import SwiftUI

struct DateLabelView: View {
    
    var labelText: String
    var xLocation: Double
    
    var body: some View {
        
            VStack {
                Text(labelText)
                    .background(.white)
                    .foregroundColor(labelText.count > 1 ? .blue : .white)
                    .opacity(0.5)
                    .overlay(
                        Text("▼").foregroundColor(.white)
                            .offset(y:15.5))
        }
    }
}
