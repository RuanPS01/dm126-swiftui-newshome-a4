//
//  GoalListView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 24/11/24.
//

import SwiftUI

struct GoalListView: View {
    let goal: GoalType
    var body: some View {
        HStack{
            Image(systemName: goal.icone).font(.largeTitle).frame(width: 50)
            VStack(alignment: .leading){
                Text(goal.titulo).font(.headline)
                Text(goal.descricao).font(.subheadline).foregroundColor(Color.gray)
            }
        }.foregroundStyle(.blue)
    }
}

#Preview {
    GoalListView(goal: GoalType(id: 1, icone: "moon.zzz.fill", titulo: "Descanso", descricao: "Dormir 8h por noite"))
}
