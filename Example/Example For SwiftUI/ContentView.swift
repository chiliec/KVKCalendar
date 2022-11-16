//
//  ContentView.swift
//  KVKCalendar_Example
//
//  Created by Sergei Kviatkovskii on 4/16/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import KVKCalendar

@available(iOS 14.0, *)
struct ContentView: View {
    @State private var typeCalendar = CalendarType.day
    @State private var events: [Event] = []
    @State private var updatedDate: Date?
    @State private var orientation: UIInterfaceOrientation = .unknown
    
    var body: some View {
        kvkHandleNavigationView(calendarView)
    }
    
    private var calendarView: some View {
        CalendarDisplayView(events: $events,
                            type: $typeCalendar,
                            updatedDate: $updatedDate,
                            orientation: $orientation)
        .kvkOnRotate(action: { (newOrientation) in
            orientation = newOrientation
        })
        .navigationBarTitle("", displayMode: .inline)
        .edgesIgnoringSafeArea(.bottom)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                HStack {
                    ItemsMenu<CalendarType>(type: $typeCalendar,
                                            items: CalendarType.allCases,
                                            showCheckmark: true,
                                            showDropDownIcon: true)
                    
                    Button {
                        updatedDate = Date()
                    } label: {
                        Text("Today")
                            .font(.headline)
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

@available(iOS 14.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
