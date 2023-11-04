//
//  ContentView.swift
//  Testing2
//
//  Created by Monty Harper on 10/14/23.
//

import SwiftUI

//struct ContentView: View {
//
//    @State private var span: Double = 1.0
//    @State private var currentTime: Date = Date()
//    @State private var animateSpan = false
//    @State private var inactivityTimer: Timer?
//    // @State private var detailView = false
//
//    let yOfLabelBar = 0.078 // y position of date label bar in unit space
//    let updateTimer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
//    let spanTimer = Timer.publish(every: 0.04, on: .main, in: .common).autoconnect()
//
//    let dateLabelArray = [DateLabelView(labelText: "Now", xLocation: 0.2), DateLabelView(labelText: "one hour", xLocation: 0.4), DateLabelView(labelText: "two hours", xLocation: 0.6), DateLabelView(labelText: "three hours", xLocation: 0.8)]
//
//    let eventViewArray = [EventView(title: "Dinner with the Queen", xLocation: 0.5), EventView( title: "Evening Constitutional", xLocation: 0.75)]
//
//    var body: some View {
//
//        GeometryReader { screen in
//
//            // Main ZStack layers background behind all else
//            ZStack {
//
//                // Background shows time of day by color
//                Color(.yellow)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//
//                // VStack arranges view on top of background into three tiers; timeline, events, and current information
//                VStack {
//
//                    Spacer()
//                        .frame(width: .infinity, height: 0.2 * screen.size.height)
//
//
//                    // Timeline
//                    GeometryReader { zgeo in
//
//                        ZStack {
//
//                            // Label bar background
//                            Color(.white)
//                                .frame(maxWidth: 40000, maxHeight: 0.065 * screen.size.height)
//                                .position(x:0, y:zgeo.size.height*0.5)
//
//
//                            // Hour and day markers
//                            ForEach(dateLabelArray, id: \.self.xLocation) {label in
//
//                                label
//                                    .alignmentGuide(VerticalAlignment.center) { d in
//                                        d[VerticalAlignment.center]
//                                    }
//                                    .position(x: label.xLocation * screen.size.width)
//                            }
//
//                        }
//                    } // End of Timeline ZStack
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .border(.green, width: 5.0)
//
//
////                    Text("There's not much space here but that's ok")
//
//
//
//                    // Events
//                    ZStack {
//
//                        GeometryReader { zgeo in
//
//                            // Line in background
//                            Color(.black)
//                                .frame(width: zgeo.size.width*2, height: 2)
//                                .position(x:0, y:0.5*zgeo.size.height)
//
//
//
//                            // Circle representing current time.
//                            NowView(time: currentTime)
//                            //                            .alignmentGuide(VerticalAlignment.center) { d in
//                            //                                d[VerticalAlignment.center]
//                            //                            }
//                                .position(x: 0.2 * screen.size.width, y: zgeo.size.height*0.5)
//
//                            // Circles representing events along the time line
//                            ForEach(eventViewArray, id: \.self.xLocation) { event in
//                                event
//                                //                                .alignmentGuide(VerticalAlignment.center) { d in
//                                //                                    d[VerticalAlignment.center]
//                                //                                }
//                                    .position(x: event.xLocation * screen.size.width, y: zgeo.size.height*0.5)
//                            }
//                        }
//
//                    } // End of Events ZStack
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .border(.red, width: 5.0)
//
//
//
//                    // Current Information
//                    ZStack {
//
//                        // Current Date Label
//                        Text(currentTime.formatted())
//
//                    } // End of Current Information ZStack
//                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//                    .border(.green, width: 5.0)
//
//                    Spacer()
//                        .frame(width: .infinity, height: 0.2 * screen.size.height)
//
//                } // End of main VStack
//
//                .onReceive(updateTimer) { time in
//                    currentTime = Date()
//                }
//
//
//            } // End of main ZStack
//            .ignoresSafeArea()
//
//
//        } // Close Geometry Reader
//
//    } // Close View
//}


struct ContentView: View {
   
    var body: some View {
        
        GeometryReader { screen in
            ZStack {
                
                Color(.yellow)
                    .ignoresSafeArea()
                
                ZStack {
                    
                    Color(.green)
                        .frame(maxWidth: .infinity, maxHeight: 20)
                    Text("testing")
                        .position(x:screen.size.width*0.2)
                    Text("testing")
                        .position(x:screen.size.width*0.4)
                }
                .frame(maxWidth: .infinity, maxHeight: 20   )
                .position(x:0.5*screen.size.width,y:screen.size.height*0.25)
                
                Group {
                    
                    Color(.orange)
                        .frame(maxWidth: .infinity, maxHeight: 30)
                        .position(x: screen.size.width*0.5, y:screen.size.height*0.5)
                    Text("testing")
                        .position(x: screen.size.width*0.8, y:screen.size.height*0.5)
                }
                

                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
