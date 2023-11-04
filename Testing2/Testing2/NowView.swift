//
//  NowView.swift
//  Testing2
//
//  Created by Monty Harper on 10/14/23.
//

import Foundation
import SwiftUI

struct NowView: View {
    
    var time: Date
    @State private var detailView = false
    
    var body: some View {
        
        ZStack {
            
            if detailView {
                
                Circle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.yellow)
                    .shadow(color: .white, radius: 20)
                    .opacity(0.80)
                    .overlay(
                        VStack {
                            Text(time, format: .dateTime.hour().minute().month().day().year())
                                .foregroundColor(.black)
                                .font(.headline)
                            Text("Next activity: figure this out")
                            
                        }
                    )
                    .clipShape(ContainerRelativeShape()).padding()
                
            } else {
                
                Circle().frame(width: 100, height: 100).foregroundColor(.yellow).shadow(color: .white, radius: 20)
     //           Text("Mom's face")
                
                //                        .overlay(
                //                        Text(time, format: .dateTime.hour().minute())
                //                            .offset(y: 75)
                //                            .fontWeight(.bold),
                //                        alignment: .top)
                //                        .foregroundColor(.white)
            }
        }
        .onTapGesture(perform: {detailView.toggle()})
        
    }
}





