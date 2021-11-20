//
//  ProgressTabView.swift
//  Fiducia
//
//  Created by sap on 15/11/21.
//

import SwiftUI

struct ProgressTabView: View {
    @State var statistics = [Statistic(numberTasksCompletedDaily: 0, typeTasksCompleted: [], achievementsCompleted: [])]
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProgressTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTabView()
    }
}
