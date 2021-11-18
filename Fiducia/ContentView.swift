//
//  ContentView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection = 1
    var body: some View {
        TabView(selection: $selection)  {
            ProgressTabView()
                .tabItem {
                    Label("Progress", systemImage: "chart.xyaxis.line")
                }
                .tag(0)
            TasksView(tasks: .constant([Task(name: "Makec a call", difficulty: 1, steps: ["hi"])]))
                .tabItem {
                    Label("Tasks", systemImage: "checklist")
                    
                }
                .tag(1)
            ReflectionView()
                .tabItem {
                    Label("Reflection", systemImage: "ellipsis.bubble")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
