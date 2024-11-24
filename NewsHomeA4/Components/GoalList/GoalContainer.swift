//
//  GoalContainer.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct GoalContainer: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            ForEach(goalMock){
                goal in GoalListView(goal: goal)
            }
        }
    }
}

#Preview {
    GoalContainer()
}
