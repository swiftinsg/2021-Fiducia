//
//  ContentView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            ProgressView()
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
            TasksView()
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                }
            ReflectionView()
                .tabItem {
                    Label("Reflection", systemImage: "ellipsis.bubble")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
